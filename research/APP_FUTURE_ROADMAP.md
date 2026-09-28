# ROBERT OS APP | Future Product & UX Research

**Repo now:** `monkroe/Robert-OS`  
**Proposed repo name:** `monkroe/robert-os-app` (rename not executed)  
**Path:** `research/APP_FUTURE_ROADMAP.md`  
**OWNER:** Roberto  
**Started:** 2026-09-28 (America/Chicago)  
**Status:** LIVING BRAINSTORMING / RESEARCH ONLY. Not an approved implementation specification.

## 1. Purpose: a place to think freely about the product

Collect Robert OS **app experience** ideas: screens, flows, interaction, navigation, visual language, design references, rejected alternatives, prototypes and experiments. An idea can remain unfinished for months without becoming an implementation task. Preserve the intent behind sketches and screenshots, not just a list of requested features.

This document covers both the standalone **Robert OS PWA** and its possible **Telegram Mini App** presentation. The Mini App is a graphical entry point to the OS, not a replacement for Benas, not a separate financial ledger, and not a requirement for using the PWA. Product name remains **Robert OS** regardless of GitHub repo naming.

Scope boundary: Beno personality, conversation quality and long-term memory belong to `benas-bot/research/BENAS_FUTURE_ROADMAP.md`. Ecosystem-wide integration and capital coordination belong to `robert-os-hub/research/ROBERT_OS_FUTURE_ROADMAP.md`. Detailed accepted architecture/specs and actual production state belong to their existing canonical sources. This document does not copy or override them.

**No implicit authorization:** adding an idea here does not authorize code, database changes, permissions, deployment, payment, repo rename, visibility change, commit or push. Research is not the next-work queue. Do not add this file to automatic boot, handoff, context or shutdown loading.

**Public-repo hygiene:** while this repo is public, keep entries to non-sensitive product concepts. No real personal financial records, credentials, tokens, private chats, internal security details, actual account identifiers or unredacted screenshots. Use synthetic data in UI examples. Changing visibility is a separate OWNER decision, not part of this file.

## 2. Product frame and existing boundaries

- Robert OS is a personal capital-management operating system, not just a collection of financial widgets. Product-level questions: What am I doing now? How long can I last? Where is my value? Where am I going? What actually happened?
- The five established app zones are **Cockpit, Runway, Vault, Goals, Audit**. Future visual explorations must preserve their distinct user questions instead of merging their business logic.
- **Cockpit** is the PWA's data-entry tab; the other tabs consume and interpret data. Benas or automation may be other authorized interfaces under the shared canonical write path; this is not permission for each screen to implement separate writes.
- The app is **OS-first** and remains usable without Telegram or an AI assistant. Mini App design is an additional surface, not a dependency.
- Financial displays must trace to accepted data sources and rules. A transfer is not profit; a projection is not a settled fact. No invented real-time balances or optimistic offline confirmations.
- The app is used on a phone, often around rideshare shifts: legibility, touch targets, fast state recognition and safe parked-state interactions matter more than decorative density. No complex interaction is intended while driving.
- React/TypeScript/Vite/Tailwind and shared PWA/Mini App are existing product directions to investigate against current canonical plans. A research entry does not establish that every migration phase is already live or that one UI build is technically accepted for both hosts.

## 3. Brainstorming areas

### APP-01 | Cockpit as an instrument cluster

**Question:** how can the current shift's state be understood at a glance without turning it into a busy dashboard?  
**Ideas to explore:** a three-gauge timer cluster (active time, break, shift progress); high-contrast shift status; earnings, costs and coverage; one-handed actions; start, pause and end as clearly differentiated states; explicit confirmations for irreversible steps.  
**Evidence to collect:** mockups, legibility tests on a real phone, tap/error observations, and whether a parked user finds the correct action without explanation.  
**Status:** BRAINSTORM / not a frozen layout.

### APP-02 | Runway: time rather than just balances

**Question:** how to show available living runway without suggesting that volatile assets are immediately spendable cash?  
**Ideas:** distinct hard/soft runway presentations, assumptions revealed on demand, scenario controls, last-updated markers, and traceable source figures.  
**Do not:** merge cash, invested assets and unconfirmed projections into a single misleading number.  
**Status:** OPEN.

### APP-03 | Vault: where value is held

**Question:** how to present allocation and ownership clearly across assets, locations and strategies?  
**Ideas:** holdings by location, cost basis versus market value, realized versus unrealized P&L, DCA and trading execution summaries, concentration views, and transaction drill-downs.  
**Boundary:** Crypto Tracker-derived UI concepts require separate integration review; a research mockup does not authorize migration or strategy changes.  
**Status:** OPEN.

### APP-04 | Goals: a navigable path to freedom

**Question:** how can long-term goals become understandable decisions rather than decorative progress bars?  
**Ideas:** target horizon, contribution scenarios, assumptions, what-if comparisons and visible uncertainty ranges.  
**Do not:** represent a model scenario as a guaranteed future outcome.  
**Status:** OPEN.

### APP-05 | Audit: the way back to evidence

**Question:** can any important number lead the user to the event that produced it?  
**Ideas:** chronological event view, clear distinctions among purchases, transfers and costs, export concepts, filters, corrections with auditability, data freshness and reconciliation badges.  
**Boundary:** no alternative ledger or hard deletion designed here.  
**Status:** OPEN.

### APP-06 | Telegram Mini App experience

**Question:** which OS tasks improve when opened visually from Telegram, and which belong in the full PWA?  
**Ideas:** compact Cockpit, structured input, shift card, selected Runway/Vault views, context-aware deep links from Benas, easy return to chat, loading and reconnect states, Telegram theme/viewport adaptation.  
**To investigate:** Telegram SDK, session/auth handoff, WebView/browser behavior, platform restrictions and real-device testing. None is assumed to be already implemented.  
**Boundary:** Mini App is not an autonomous second financial application.  
**Status:** OPEN.

### APP-07 | One recognizable product, two surfaces

**Question:** what should be visually and behaviorally consistent between PWA and Mini App, and what should adapt to the host?  
**Ideas:** shared component vocabulary, typography, spacing, status labels, navigation model and contextual entry points, without forcing identical screens into different viewports.  
**Status:** OPEN.

### APP-08 | Design system and visual experiments

**Ideas to compare:** premium dark mode; charcoal cards; cyan/teal active states; purple secondary indicators; yellow paused state; restrained red destructive actions; high-contrast typography; gauges versus compact cards; minimal charts versus detailed analytics.  
**Rule:** references, AI-generated mockups and screenshots are **examples**, not accepted UI specifications. Record what worked, what failed, viewport dimensions, synthetic test data and OWNER feedback. Do not commit third-party image assets without checking reuse rights.  
**Status:** BRAINSTORM.

### APP-09 | Failures, freshness and trust

**Question:** what does the user see when a service is unavailable, stale or ambiguous?  
**Ideas:** clear offline/read-only indication, no false success after a request, timestamped data, retry without duplicate effect, distinct pending/confirmed/reconciled states, unobtrusive error recovery.  
**Status:** OPEN.

### APP-10 | Accessibility and use in context

**Ideas:** thumb reachability, adequate touch targets, readable text in daylight, reduced motion, meaningful color plus text (not color alone), localization, battery/data efficiency, and clear safe-state design around shift workflows.  
**Test condition:** real Samsung phone and both browser and Telegram host, when those hosts are actually available for testing.  
**Status:** OPEN.

## 4. Idea card: append rather than turn into a task by default

```text
APP-XXX | Short title
Date / source: OWNER note, screenshot, sketch, observed issue or external reference
Surface: PWA / Telegram Mini App / shared
User problem: what is difficult today?
Sketch: description or relative image path (synthetic/redacted)
Alternatives: at least two where a choice is open
Evidence: VERIFIED / SUPPLIED / HYPOTHESIS / PROPOSED / OWNER DECISION
What is unknown: platform constraints, data provenance, cost, accessibility
Test: how to compare mockups or behavior without touching production
OWNER direction: OPEN / ACCEPTED FOR RESEARCH / REJECTED / SUPERSEDED
Canonical destination if later approved: named spec / ADR / implementation repo
```

Use `VERIFIED` only with a checked primary source, version/date and actual test scope. A generated mockup cannot verify live behavior. `OWNER DECISION` records Roberto's explicit choice; it does not itself deploy code. If an idea is superseded, preserve the earlier reasoning and point to its replacement rather than silently rewriting history.

## 5. Evaluation before any implementation proposal

For UI choices, prefer a small comparison with synthetic data and a stated user task. Observe: time to understand state, taps to complete the task, accidental-action risk, readability, error recovery, freshness clarity, loading performance, and accessibility. Keep PWA and Mini App measurements distinct where hosts behave differently. Evaluate on the phone rather than assuming a desktop preview proves mobile ergonomics.

Only after an explicit OWNER selection should a candidate move to an appropriately scoped specification and independent implementation assignment. Code changes, DB changes, deployment, repo rename and public/private conversion each require their own authorization.

## 6. Open product decisions

| ID | Question | State |
|---|---|---|
| APP-D01 | Which Cockpit gauge/card variant makes shift state clearest? | OPEN |
| APP-D02 | Which screens should the Mini App expose first? | OPEN |
| APP-D03 | What is genuinely shared between PWA and Mini App, and what must adapt? | OPEN |
| APP-D04 | How are pending, offline and stale financial figures displayed? | OPEN |
| APP-D05 | What minimum design tokens and component vocabulary unify five tabs? | OPEN |
| APP-D06 | Should the repo be renamed `robert-os-app`, and after which Pages/auth/link checks? | PROPOSED; not executed |
| APP-D07 | When should the currently public repo become private, and what will that mean for Pages? | DEFERRED OWNER DIRECTION |

## 7. Reference map (pointers, not copies)

- Ecosystem-wide interactions: `monkroe/robert-os-hub`, `research/ROBERT_OS_FUTURE_ROADMAP.md`.
- Accepted architecture, actual migration state and data rules: Hub `STATUS.md`, ADR and specs. Read at decision time.
- Benas AI and conversational experience: `monkroe/benas-bot`, `research/BENAS_FUTURE_ROADMAP.md`.
- Strategy-specific research: `monkroe/dca-bot` and `monkroe/kraken-trading-bot` research documents.
- Existing app implementation: this repository's code; verify branch and commit before claiming present behavior.

## 8. Changelog

- **2026-09-28 | OWNER DIRECTION:** establish a separate application brainstorming space for the PWA and Telegram Mini App; prefer `robert-os-app` as future lowercase repo name; consider private visibility later, without performing either change as part of research creation.
- **2026-09-28 | INITIAL RESEARCH:** APP-01–APP-10 and APP-D01–APP-D07 seeded as product exploration, not as a new production roadmap or agent task queue.
