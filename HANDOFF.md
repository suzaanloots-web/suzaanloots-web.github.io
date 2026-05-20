# Session Handoff — Kanya Hunt Website
**Written:** 2026-05-20 (end of session)
**Project root:** `G:\My Drive\Kanya Hunt\Github\hunthouse-website\`

---

## Project overview

Kanya Hunt's luxury couverture chocolate portfolio website. Static HTML/CSS, multi-page. Hosted on GitHub Pages via `suzaanloots-web.github.io`. The site is a 90-day re-entry strategy for the Cape Town & Winelands luxury wedding cake market. Full strategy doc: `G:\My Drive\Kanya Hunt\KanyaHunt_Roadmap2026_SHORT DAILED PLANV2.docx`.

**Run by:** Suzaan Loots (non-technical — no code dumping; plain English always).
**Do NOT push to origin/GitHub Pages without Suzaan's explicit go-ahead.**

---

## What happened this session

### 1. Petite Creations page — full rewrite (`croquembouche-minis.html`)
Page was previously titled "Croquembouche & Minis" with 8 placeholder divs.

**Renamed throughout to "Petite Creations":**
- `<title>` tag, meta description, OG tags
- Eyebrow text → "Section 03 · Petite Creations"
- H1 → "Petite *Creations*"
- Hero intro copy rewritten
- Craft section: heading changed to "Small in scale, *full in craft*", both body paragraphs rewritten, new quote
- CTA: heading changed to "Something petite, *perfectly made*", body rewritten
- Footer portfolio link updated on this page

**8 placeholder slots replaced with real images:**

| Slot | Class | File | Source image |
|------|-------|------|--------------|
| 1 | `feature` | `cm-01-mini-cake.jpg` | 20081002_570.jpg |
| 2 | `feature-wide` | `cm-02-choc-cylinders.jpg` | IMG_5897.JPG |
| 3 | standard | `cm-03-lemon-cupcake.jpg` | 20081002_602.jpg |
| 4 | standard | `cm-04-choc-cupcakes.jpg` | IMG_1514.JPG |
| 5 | standard | `cm-05-rose-cupcake.jpg` | KanyaHunt-024.jpg |
| 6 | standard | `cm-06-hands-cupcake.jpg` | blush-emerald-466.jpg |
| 7 | standard | `cm-07-croquembouche.jpg` | IMG_5716.jpeg |
| 8 | standard | `cm-08-croquembouche-spun.jpg` | JPU0865.JPG |

Grid cell count: 1 feature (4) + 1 feature-wide (2) + 6 standard (6) = **12 cells ✓**

All 8 cm- image files were optimised and saved to `images/` in the previous session segment (before context summary). They are **untracked** — not yet committed.

### 2. Footer link "Petite Creations" — updated across all 8 pages
Changed `Croquembouche &amp; Minis` → `Petite Creations` (href `croquembouche-minis.html` unchanged) in:
- `croquembouche-minis.html` (own footer)
- `chocolate-weddings.html`
- `white-chocolate-weddings.html`
- `celebration-cakes.html`
- `buttercream-sugar-art.html`
- `weekend-cakes.html`
- `gallery.html`
- `index.html` — also updated the offering card title/body/alt, contact form dropdown option

### 3. Earlier in session (before context compaction)
- **Real Weddings gallery.html slot 3:** replaced dark Landman photo with `rw-03-thunder-bw.jpg` (B&W Thunder & Love editorial shot, 1200×800)
- **Celebration Cakes** (`celebration-cakes.html`): all 10 placeholder slots filled with real photos, multiple swap/tweak rounds. Final structure: 1 feature + 1 feature-wide + 9 standard = 15 cells ✓. Images `cc-01` through `cc-12` (cc-09 not used).

---

## ⚠️ WHERE WE STOPPED — INCOMPLETE

Suzaan gave these 4 instructions for the Petite Creations gallery and then ended the session **before they were implemented:**

> a) Image 4 needs to be rotated and then make it the hero image  
> b) Move the current hero nr1 to nr3  
> c) Remove the current nr3  
> d) Swap 2 and 6 around  

**None of these changes have been made to the HTML or images yet.**

### ⚠️ Grid math warning for next session

After applying instructions a–d, you will have 7 content slots (one removed). The proposed structure:
- 1 feature (cm-04, rotated) = 4 cells
- 1 feature-wide = 2 cells
- 5 standard = 5 cells
- **Total = 11 cells — NOT divisible by 3 → gap in the grid**

**You must resolve this before committing.** Options:
1. Find a replacement 8th image (best option — browse the cupcakes source folder for a good spare)
2. Remove the feature-wide slot (drop to 1 feature + 6 standard = 10 — also not divisible by 3)
3. Change to 2 feature-wide slots (complex, may look odd)
4. **Simplest fix:** keep 8 total slots by substituting a different standard image instead of deleting cm-03 outright — ask Suzaan

Also note: **instruction d ("swap 2 and 6")** swaps a feature-wide slot (slot 2) with a standard slot (slot 6). Clarify with Suzaan whether she means:
- Content-only swap (images swap, slot classes stay) — landscape cm-02 in portrait standard slot may look awkward
- Full swap including div class — changes grid structure

### Image rotation needed (instruction a)
`cm-04-choc-cupcakes.jpg` is currently **landscape (1200×791)**. To use as a portrait hero (feature slot), rotate 90° clockwise:
```powershell
Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("G:\My Drive\Kanya Hunt\Github\hunthouse-website\images\cm-04-choc-cupcakes.jpg")
$img.RotateFlip([System.Drawing.RotateFlipType]::Rotate90FlipNone)
# then resize to max 1800px long edge and save — bump to ?v=3
```
If rotated result looks upside-down, use `Rotate270FlipNone` instead.

---

## Next tasks — priority order

1. **Apply the 4 pending Petite Creations gallery changes (a–d above)**
   - Rotate cm-04, make it hero; demote cm-01 to standard; remove cm-03; swap 2 & 6
   - Resolve the grid math gap (see warning above)
   - Clarify swap-2-and-6 intent with Suzaan before touching slot classes

2. **Homepage photo picks** — the biggest remaining job
   - Slots: hero ×4, about portrait ×1, offering card images ×6, contact frames ×2, Instagram strip ×4 (~20 slots)
   - Source folders: `D:\Website with Suzaan profile pics\` (26 photos), `D:\Website with Suzaan generics\` (50 photos)
   - Awaiting Kanya/Suzaan's picks

3. **White Chocolate Weddings** (`white-chocolate-weddings.html`) — 14 placeholder slots
   - Source: `D:\Website with Suzaan white chocolate cakes\` (89 photos)
   - Awaiting photo picks

4. **WhatsApp number** — replace `27XXXXXXXXX` and `+27 XX XXX XXXX` across all 8 HTML files when Kanya provides it

5. **Push to GitHub Pages** — only with Suzaan's explicit go-ahead (currently 20 commits ahead of origin/main)

---

## Current git status

- **Branch:** main
- **Ahead of origin/main by:** 20 commits (local only, not pushed)
- **Modified (not staged):** all 8 HTML files (footer link changes + croquembouche-minis full rewrite)
- **Untracked new images (not committed):**
  - `cm-01-mini-cake.jpg` through `cm-08-croquembouche-spun.jpg` (8 Petite Creations images)
  - `cc-09-purple-gold.jpg`, `cc-10-overhead-roses.jpg` — orphaned celebration cakes images (not used in HTML, safe to delete)
  - `wc-06.jpg`, `wc-11-chiffon.jpg`, `wc-13-chiffon.jpg`, `wc-14-ivory-roses.jpg` — orphaned weekend cakes images (safe to delete later)
  - `bs-04-white-tower.jpg` — orphaned buttercream image (safe to delete later)

---

## Patterns and decisions to carry forward

- **Grid math rule:** Total grid cells must be divisible by 3. feature=4 cells, feature-wide=2 cells, standard=1 cell. Always verify before committing.
- **Cache-busting:** Always append `?v=2` (or bump to ?v=3, ?v=4) on every img src. When overwriting an image file in the same session, bump the version.
- **Content-only swaps:** When swapping two images, swap only `src`, `alt`, `style` attributes and the caption text — never touch the div class or stagger delays (d1/d2/d3). This preserves the reveal animation stagger.
- **object-position tricks:** `center top` = anchors to top (use when cake head is cut off); `75% center` = slightly right of centre; default `center center`.
- **Never upscale images** — cap at `Math.Min(1.0, maxPx/longEdge)` in the optimizer.
- **No fondant/buttercream** in the chocolate wedding sections — brand positioning depends on it.
- **Preview server:** already configured at port 3458, name `kanya-hunt`. Start with `preview_start name=kanya-hunt`. Navigate with `preview_eval` → `window.location.href`.
- **Optimizer script:** `scripts\optimize-image.ps1` — slots: `hero` (1800px), `gallery` (1200px).

---

## Problems / errors this session

- None blocking. The grid math gap (11 cells after Suzaan's pending changes) is the main unresolved issue requiring attention at the start of the next session.
