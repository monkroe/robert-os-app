#!/usr/bin/env bash
# Self-tests for test.sh: a clean copy passes, each broken copy fails
# on the expected check. Works on a temp copy; the repo is never touched.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/rob-app-selftest.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT
W="$TMP/w"
cases=0

fresh() {
  rm -rf "$W"; mkdir -p "$W"
  tar -C "$REPO" --exclude=.git -cf - . | tar -C "$W" -xf -
}

expect_pass() {
  cases=$((cases + 1))
  if ! out="$("$REPO/test.sh" "$W" 2>&1)"; then
    printf '%s\n' "$out"; echo "SELFTEST FAIL: $1 should pass"; exit 1
  fi
  echo "ok - $1"
}

expect_fail() {
  cases=$((cases + 1))
  if out="$("$REPO/test.sh" "$W" 2>&1)"; then
    printf '%s\n' "$out"; echo "SELFTEST FAIL: $1 should fail"; exit 1
  fi
  printf '%s\n' "$out" | grep -q "^$2=FAIL" || {
    printf '%s\n' "$out"; echo "SELFTEST FAIL: $1 did not trip $2"; exit 1
  }
  echo "ok - $1 -> $2"
}

fresh; expect_pass "clean copy"

fresh; sed -i 's|src="js/app.js"|src="js/missing.js"|' "$W/index.html"
expect_fail "index.html points to a missing file" INDEX_REFS

fresh; rm "$W/js/modules/costs.js"
expect_fail "sw.js ASSETS file deleted" SW_ASSETS

fresh; printf 'function (\n' >> "$W/js/utils.js"
expect_fail "syntax error in an ES module" JS_SYNTAX

fresh; printf 'function (\n' >> "$W/sw.js"
expect_fail "syntax error in sw.js" JS_SYNTAX

fresh; printf '{' > "$W/manifest.json"
expect_fail "invalid manifest.json" MANIFEST_JSON

echo "SELFTEST=PASS ($cases cases)"
