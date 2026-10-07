#!/usr/bin/env bash
# v1 quality gate for the live PWA on main. Needs only bash and node.
# Usage: ./test.sh [ROOT]   (ROOT defaults to this script's directory)
set -euo pipefail

ROOT="${1:-$(cd "$(dirname "$0")" && pwd)}"
cd "$ROOT"
fail=0

command -v node >/dev/null 2>&1 || { echo "FAIL: node not found"; exit 1; }

# Local reference -> repo path; prints nothing for external references.
local_path() {
  local ref="$1"
  case "$ref" in
    http:*|https:*|//*|data:*|mailto:*|javascript:*|\#*) return 0 ;;
  esac
  ref="${ref%%\?*}"
  ref="${ref%%#*}"
  ref="${ref#./}"
  printf '%s\n' "${ref:-.}"
}

# 1. JS syntax. Files are fed on stdin with an explicit parse mode:
# plain `node --check f.js` silently passes an ES module that has a
# syntax error (module detection), so it must not be used here.
# js/ is loaded as ES modules (index.html type="module"); sw.js is a
# classic service worker script.
ok=1; n=0
check_js() {
  local mode="$1" f="$2" err
  n=$((n + 1))
  if ! err="$(node --input-type="$mode" --check < "$f" 2>&1)"; then
    echo "FAIL: syntax $f"
    printf '%s\n' "$err" | grep -m1 -E 'Error' || true
    ok=0
  fi
}
[ -d js ] || { echo "FAIL: js/ missing"; ok=0; }
mapfile -d '' files < <(find js -type f -name '*.js' -print0 2>/dev/null | sort -z)
[ "${#files[@]}" -gt 0 ] || { echo "FAIL: no .js files under js/"; ok=0; }
for f in "${files[@]}"; do check_js module "$f"; done
check_js commonjs sw.js
if [ "$ok" = 1 ]; then echo "JS_SYNTAX=PASS ($n files)"; else echo "JS_SYNTAX=FAIL"; fail=1; fi

# 2. manifest.json parses as JSON
if node -e 'JSON.parse(require("fs").readFileSync(process.argv[1], "utf8"))' manifest.json 2>/dev/null; then
  echo "MANIFEST_JSON=PASS"
else
  echo "FAIL: manifest.json is not valid JSON"
  echo "MANIFEST_JSON=FAIL"; fail=1
fi

# 3. Local src/href in index.html exist (external URLs skipped)
ok=1; n=0
while IFS= read -r ref; do
  p="$(local_path "$ref")"
  [ -n "$p" ] || continue
  n=$((n + 1))
  [ -e "$p" ] || { echo "FAIL: index.html -> $ref (missing $p)"; ok=0; }
done < <(grep -oE '(src|href)="[^"]+"' index.html | sed -E 's/^(src|href)="//; s/"$//')
[ "$n" -gt 0 ] || { echo "FAIL: no local references found in index.html"; ok=0; }
if [ "$ok" = 1 ]; then echo "INDEX_REFS=PASS ($n local)"; else echo "INDEX_REFS=FAIL"; fail=1; fi

# 4. Local entries of the sw.js ASSETS list exist (external CDN skipped)
ok=1; n=0
while IFS= read -r ref; do
  p="$(local_path "$ref")"
  [ -n "$p" ] || continue
  n=$((n + 1))
  [ -e "$p" ] || { echo "FAIL: sw.js ASSETS -> $ref (missing $p)"; ok=0; }
done < <(sed -n '/const ASSETS = \[/,/\];/p' sw.js | grep -v '^[[:space:]]*//' | grep -oE "['\"][^'\"]+['\"]" | sed -E "s/^['\"]//; s/['\"]\$//")
[ "$n" -gt 0 ] || { echo "FAIL: no local ASSETS entries found in sw.js"; ok=0; }
if [ "$ok" = 1 ]; then echo "SW_ASSETS=PASS ($n local)"; else echo "SW_ASSETS=FAIL"; fail=1; fi

if [ "$fail" = 0 ]; then echo "test.sh: PASS"; else echo "test.sh: FAIL"; exit 1; fi
