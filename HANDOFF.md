# Session Handoff — Kanya Hunt Website
**Written:** 2026-05-20 (mid-day, by Opus 4.7)
**Reason for handoff:** Suzaan is switching to **Sonnet 4.6** for cost reasons — the remaining work is image swapping, caption fixes, and HTML editing, which Sonnet handles cleanly.
**Project root:** `G:\My Drive\Kanya Hunt\Github\hunthouse-website\`

---

## Read this first

**Suzaan Loots** runs the project. She is **non-technical** — no code dumps, plain English always. She prefers natural conversation over dropdown questionnaires. Use `AskUserQuestion` sparingly. She'll often want to see a screenshot of the result rather than read about it.

**Do NOT push to origin/GitHub Pages without Suzaan's explicit go-ahead.** Local branch is 20+ commits ahead of `origin/main` — intentional, not a problem.

Full agent context lives in `CLAUDE.md` in this folder — read that for brand positioning, photo curation criteria, the optimizer script usage, and the don'ts list.

---

## What just got done (this Opus session, 2026-05-20)

### Petite Creations gallery shuffle — DONE in HTML, NOT YET COMMITTED

Suzaan asked for 4 changes; all applied:
- a) Rotated `cm-04-choc-cupcakes.jpg` from landscape 1200×791 to **portrait 791×1200** and made it the new **hero** (feature slot). Cache-busted to `?v=3`.
- b) Demoted old hero `cm-01-mini-cake.jpg` down to **slot 3**.
- c) Removed `cm-03-lemon-cupcake.jpg` from the page (file still in `images/` — orphan, safe to delete later).
- d) Content-only swap of slots 2 ↔ 6 (cm-02 cylinders and cm-06 hands-cupcake swapped images; slot classes preserved).

Also: **added a new 8th image** `cm-09-red-velvet-towers.jpg` (sourced from `IMG_7228.JPG`) to fix the grid math gap — without it the page would have had 11 cells (not divisible by 3, leaves a gap). It sits in slot 4 with d3 stagger.

**Final gallery order (8 slots, 12 cells ✓):**
| Pos | Class | Image | Notes |
|-----|-------|-------|-------|
| 1 | feature | cm-04 (rotated) | New hero — dark chocolate cupcakes w/ gold filigree |
| 2 | feature-wide | cm-06 | Hands holding cream-swirl cupcake (portrait → wide crop) |
| 3 | standard | cm-01 | Demoted ex-hero, mini cake on silver tray |
| 4 | standard | cm-09 | NEW — red velvet mini towers w/ berries |
| 5 | standard | cm-05 | White couverture rose cupcake |
| 6 | standard | cm-02 | Chocolate + strawberries (was in feature-wide) |
| 7 | standard | cm-07 | White croquembouche tower |
| 8 | standard | cm-08 | Spun-sugar croquembouche |

Verified live in the preview server (`http://localhost:3458/croquembouche-minis.html`). All 8 images load. No console errors.

---

## ⚠️ Two open concerns on Petite Creations — ASK SUZAAN

These were flagged to Suzaan in the preview review but not yet resolved:

### Concern 1: cm-02 image is mis-captioned
The image `cm-02-choc-cylinders.jpg` actually shows **chocolate-dipped strawberries with chocolate curls**, NOT chocolate cylinder cakes. The alt text and caption say "Dark couverture cylinders — individual by design" which is wrong. This mislabel was inherited from the prior session — not introduced by the shuffle.

**Options to put to Suzaan:**
- Rewrite the caption to match the actual photo (e.g. *"Strawberries draped in dark couverture — a fresh take"*)
- Find an actual cylinder-cake photo from the source folder and swap the image in (keep filename, bump cache-bust)
- Remove cm-02 entirely and substitute another photo

Find the HTML at `croquembouche-minis.html` around lines 87–89 (current position is slot 6, classes `gallery-item reveal d1`).

### Concern 2: cm-06 in feature-wide slot is portrait-source in landscape slot
Because of the content-only swap, cm-06 (portrait photo of hands cradling a cupcake) now sits in slot 2 which is landscape-shaped. CSS `object-fit: cover` crops the top/bottom of the portrait image to fit the landscape frame. The result still reads as "hands cradling cupcake" but loses breathing room.

If Suzaan dislikes the crop:
- Try `object-position: center top` or `center bottom` on that gallery-item to anchor the crop differently
- Or revert: put cm-02 back in slot 2 (its native landscape works there) and find a different way to honor the "swap 2 and 6" intent
- Or pick a different photo for slot 2 that is natively landscape

---

## Git status

- **Branch:** main (20 commits ahead of `origin/main`, intentional, do not push)
- **Modified, NOT staged:**
  - `croquembouche-minis.html` (gallery shuffle)
- **Untracked, NOT staged:**
  - `images/cm-09-red-velvet-towers.jpg` (new image, 164 KB)
  - `images/cm-04-choc-cupcakes.jpg` was overwritten in place — counts as a modification of a tracked file (was added earlier this session)

Earlier this session a commit landed for the full Petite Creations rewrite + footer updates + all 8 cm- images. Suzaan said "committed" so check `git log` if uncertain.

**Do not commit the gallery shuffle until Concerns 1 & 2 are resolved.** Once resolved, suggested commit message:
> Petite Creations gallery shuffle: rotated cm-04 to hero, demoted cm-01, removed cm-03, swapped 2/6, added cm-09 red velvet towers

---

## Pending work — priority order

### 1. Resolve the two open concerns above (Petite Creations) — FAST

### 2. Homepage photo picks — BIG JOB
- `index.html` slots: hero ×4, about portrait ×1, offering cards ×6, contact frames ×2, Instagram ×4 (~20 slots)
- Source folders:
  - `D:\Website with Suzaan profile pics\` (26 photos — for About-Kanya portrait)
  - `D:\Website with Suzaan generics\` (50 photos — for hero, Instagram, supporting)
- Awaiting Suzaan's picks. When she sends a list of codes, map → filenames → optimize → slot.

### 3. White Chocolate Weddings (`white-chocolate-weddings.html`) — 14 placeholder slots
- Source: `D:\Website with Suzaan white chocolate cakes\` (89 photos)
- Awaiting picks

### 4. Real Weddings (`gallery.html`) — 15 placeholder slots (slot 3 already done, see `rw-03-thunder-bw.jpg`)
- Source: `D:\Website with Suzaan cake cutting\` (114 photos)
- Awaiting picks

### 5. WhatsApp number — global find-and-replace
Replace `27XXXXXXXXX` and `+27 XX XXX XXXX` across all 8 HTML files when Kanya provides the real number.

### 6. Price anchor in `index.html` contact form
Replace `R[X] for up to [Y] guests` placeholder with real values once Suzaan provides.

### 7. Push to GitHub Pages — only with Suzaan's explicit go-ahead

---

## Patterns to follow (don't deviate)

- **Grid math:** Total grid cells must be divisible by 3. `feature` = 4 cells, `feature-wide` = 2 cells, `standard` = 1 cell. Always verify before committing.
- **Cache-busting:** Append `?v=2` (or bump to `?v=3`, `?v=4`) on every `img src`. When overwriting an image file in the same session, **bump the version** or browsers serve the stale cached copy.
- **Content-only swaps:** When swapping two images between slots, swap only `src`, `alt`, `style`, and the caption text — never touch the div class or the `d1/d2/d3` stagger classes (that preserves the reveal animation).
- **object-position tricks:** `center top` anchors to top (use when cake heads are cut off); `75% center` for slightly-right-of-centre; default is `center center`.
- **Never upscale images.** The optimizer caps at `Math.Min(1.0, maxPx / longEdge)`.
- **No fondant or buttercream** in the §1 wedding cake sections (chocolate-weddings, white-chocolate-weddings) — brand positioning is built on "exclusively couverture chocolate".
- **Preview server:** Already running on port 3458, name `kanya-hunt`. Use `preview_eval` to navigate: `window.location.href = '/croquembouche-minis.html?t=' + Date.now()`. The server cwd is `Github/hunthouse-website` — paths are relative to that, e.g. `/index.html`, NOT `/Github/hunthouse-website/index.html`.
- **Optimizer:** `powershell -ExecutionPolicy Bypass -File "scripts\optimize-image.ps1" -Source "..." -Name "..." -Slot "gallery"` (slots: `hero` 1800px, `gallery` 1200px, `offering` 800px, `portrait` 1000px, `frame` 1200px, `instagram` 500×500).
- **Image rotation:** `[System.Drawing.Image]::FromFile($src); $img.RotateFlip([System.Drawing.RotateFlipType]::Rotate90FlipNone)` — if result is upside-down use `Rotate270FlipNone`.
- **Photo curation:** Use a general-purpose sub-agent when picking from >5 photos — it conserves context vs. viewing them all in main thread.

---

## Files in the repo you'll actually touch

- `index.html` — homepage
- `chocolate-weddings.html`, `white-chocolate-weddings.html`, `celebration-cakes.html`, `croquembouche-minis.html`, `buttercream-sugar-art.html`, `weekend-cakes.html` — 6 portfolio sub-pages
- `gallery.html` — Real Weddings portfolio
- `portfolio-style.css` — shared CSS (rarely needs changes)
- `scripts/optimize-image.ps1` — image pipeline
- `images/` — all optimized photos go here

Orphaned images (in `images/`, not referenced in any HTML — safe to delete when convenient):
`cm-03-lemon-cupcake.jpg`, `cc-09-purple-gold.jpg`, `cc-10-overhead-roses.jpg`, `wc-06.jpg`, `wc-11-chiffon.jpg`, `wc-13-chiffon.jpg`, `wc-14-ivory-roses.jpg`, `bs-04-white-tower.jpg`.

---

## How Suzaan likes to work

- She sends photo picks as shortened codes (e.g. `2386` = `IMG_2386.JPG`, `PB32` = `PB (32).jpg`). Use `Get-ChildItem -Filter "*pattern*"` to resolve.
- She has "Definitely" and "Maybe" lists. For Definitelys: check them against the 6 photo criteria honestly — flag any that fail (she wants real feedback). For Maybes: you pick the strongest up to the slot count.
- After each slot is filled, reload the preview and screenshot the result.
- She iterates — expect rotation requests, swaps, removals after seeing the rendered page. The optimizer handles re-processing cleanly.

---

## When to escalate back to Opus

- Brand-voice copywriting decisions (real testimonials, price anchor wording, new copy)
- Strategy/architecture changes (new pages, new offerings, restructure)
- Pre-deploy final review before pushing to GitHub Pages
- Anything where you're stuck and need a fresh angle

For everything else — image swaps, captions, layout iteration, photo curation — Sonnet 4.6 is the right tool.
