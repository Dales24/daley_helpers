# CLAUDE.md — engineering rules

Rules for any change in this repo. Optimize for the next reader.

## Review bar

Every change is reviewed against these. A change that fails one gets sent back.

### 1. Readable
- Write the obvious version, not the clever one. Code is read far more than written.
- Name things for what they are (`track_builder`, not `tb`). No single letters except loop indices.
- Return early; flatten nesting. No deep pyramids.

### 2. Simple
- Do the smallest thing that solves the task. No speculative features.
- No premature abstraction — add a layer only when there are two real callers.
- Delete dead code instead of commenting it out.

### 3. Modular
- One function, one job. If it needs a paragraph to explain, split it.
- Respect module boundaries. Call a module's interface; don't reach into its internals.
- Shared constants live in one place, imported — never redefined.

### 4. Corners & edge cases
- Handle empty input, single element, missing/NaN, network failure, malformed input — explicitly.
- Fail loud and clear (`FileNotFoundError("no model named X")`), not with a cryptic downstream throw.
- Cover the failure path with a test, not just the happy path.

### 5. Speed
- Know the hot path; don't do O(n²) where O(n) is easy.
- No needless copies, no re-fetching in a loop, no work inside a loop that belongs outside it.
- Measure before optimizing further — don't guess.

### 6. Limited comments
- Comment the **why**, not the **what** — the code says what.
- One line beats a paragraph. Explain non-obvious math, model assumptions, API quirks.
- Delete stale comments when the code they describe changes.

## Definition of done
1. Readable, simple, modular.
2. Edge cases handled and tested.
3. Fast on the hot path.
4. Comments explain the non-obvious, nothing else.
