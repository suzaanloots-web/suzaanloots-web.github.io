# Kanya Hunt website — agent handover notes

> Last updated by Sonnet 4.6, 2026-05-27.
> All 9 pages fully photographed and live. All copy changes applied. about.html underwent a major layout overhaul this session. See structural facts below for current state.

## The brand in one paragraph

**Kanya Hunt** is a luxury **couverture chocolatier** in Cape Town. The website is part of a 90-day re-entry strategy for the Cape Town & Winelands luxury wedding cake market. The hero positioning: *"Every competitor is a fondant artist who also does chocolate. Kanya is a chocolate artist, full stop."* Wedding cakes are the primary offering. Other commissions (buttercream, sugar art, weekend cakes) exist but the chocolate specialism is the brand's competitive moat.

The full strategy doc lives at `G:\My Drive\Kanya Hunt\KanyaHunt_Roadmap2026_SHORT DAILED PLANV2.docx` — read it if you need positioning context for any new copy.

## User profile

**Suzaan Loots** is Kanya's partner (running the operations side). She's **non-technical** — cannot read code, needs hand-holding through any technical decisions. Don't dump code blocks at her unless she asks. Use plain English, screenshots, and clear option lists. She prefers natural conversation over dropdown questionnaires (she dismisses `AskUserQuestion` prompts often). Use them sparingly.

## Project structure

```
G:\My Drive\Kanya Hunt\Github\hunthouse-website\
├── index.html                        homepage (2-section "Creations" layout)
├── chocolate-weddings.html           §1.1 — DONE (14 real photos, completed in prior session)
├── white-chocolate-weddings.html     §1.2 — placeholders, ready for photos
├── celebration-cakes.html            §2.1 — placeholders
├── croquembouche-minis.html          §2.2 — placeholders
├── buttercream-sugar-art.html        §2.3 — placeholders
├── weekend-cakes.html                §2.4 — placeholders (has special "join the WhatsApp list" copy)
├── gallery.html                      Real Weddings page — placeholders
├── portfolio-style.css               shared CSS for all sub-pages
├── images/                           optimized photos go here, named cw-XX-name.jpg, ww-XX-name.jpg etc
├── scripts/optimize-image.ps1        image processing pipeline (see usage below)
└── chocolate-pour-web.mp4            hero video (existing)

# Source photo folders (originals, large — never edit these)
D:\Website with Suzaan chocolate cakes\          (74 photos — DONE)
D:\Website with Suzaan white chocolate cakes\    (89 photos)
D:\Website with Suzaan buttercream and other sugar art\  (105 photos)
D:\Website with Suzaan smaller order or single tiered buttercream cake\  (67 photos — for celebration cakes)
D:\Website with Suzaan chiffons\                 (41 photos — for weekend cakes)
D:\Website with Suzaan Cupcakes and individual units\  (66 photos — for croquembouche & minis)
D:\Website with Suzaan weekend cakes\            (131 photos)
D:\Website with Suzaan cake cutting\             (114 photos — for Real Weddings gallery)
D:\Website with Suzaan profile pics\             (26 photos — for About-Kanya portrait on homepage)
D:\Website with Suzaan generics\                 (50 photos — atmospheric, Instagram, supporting)

# Backup folder
G:\My Drive\Kanya Hunt\backups\                  (old html backups + leftover .css)
```

## The 6 photo curation criteria

Every photo must pass these checks:

1. 📸 Sharp focus
2. 💡 Good lighting (natural where possible; no orange tungsten, no harsh flash)
3. 🎯 Strategic fit (visibly **chocolate** work for chocolate sections; never sneak fondant or sugar art into the §1 wedding cake sections)
4. 📐 Resolution suitable for slot (see "Image dimensions" below)
5. 🎨 Compositional strength (cake is the subject, clean background, not awkwardly cropped)
6. 📱 Reads well at thumbnail size

## Image optimization pipeline

```powershell
powershell -ExecutionPolicy Bypass -File "scripts\optimize-image.ps1" `
    -Source "D:\Website with Suzaan [folder]\IMG_XXXX.JPG" `
    -Name "cw-01-petal-cake" `
    -Slot "gallery"
```

Available slots and target sizes:

| Slot | Max dimension | Use for |
|------|---------------|---------|
| `hero` | 1800px long edge | hero slideshow + feature gallery items |
| `gallery` | 1200px long edge | portfolio standard slots, detail close-ups |
| `offering` | 800px long edge | homepage offering cards |
| `portrait` | 1000px long edge | About-Kanya portrait |
| `frame` | 1200px long edge | contact section frame photos |
| `instagram` | 500×500 square crop | homepage Instagram preview row |

Naming convention: prefix by section + sequence + descriptive slug.
- `cw-XX-name` = chocolate weddings
- `ww-XX-name` = white chocolate weddings
- `cc-XX-name` = celebration cakes
- `cm-XX-name` = croquembouche & minis
- `bs-XX-name` = buttercream & sugar art
- `wc-XX-name` = weekend cakes
- `rw-XX-name` = real weddings (gallery)
- `home-XX-name` = homepage (hero slideshow, about portrait, etc.)

## Portfolio page HTML pattern

Every portfolio page has placeholder gallery items like this:

```html
<div class="gallery-item placeholder feature reveal">
  <div><div class="placeholder-num">01</div><div class="placeholder-label">Hero feature</div></div>
</div>
```

When slotting a real photo, replace with:

```html
<div class="gallery-item feature reveal">
  <img src="images/cw-01-petal-cake.jpg?v=2" alt="Descriptive alt text" loading="lazy"/>
  <div class="gallery-caption">Short italic caption shown on hover</div>
</div>
```

**Cache-busting:** ALWAYS append `?v=2` to image src. If overwriting an existing image file in the same session, bump to `?v=3`, `?v=4`, etc., or browsers serve the cached old version.

## CSS classes for gallery items

| Class | Effect | Use for |
|-------|--------|---------|
| `gallery-item` *(default)* | 1 col × auto height, 3:4 portrait aspect | Standard portrait photos |
| `gallery-item feature` | **2 cols × 2 rows**, 3:4 portrait | Hero of the page (one per page) |
| `gallery-item feature-wide` | 2 cols × 1 row, 3:2 landscape | Genuinely-landscape photos |
| `gallery-item feature-full` | Full width × auto, 3:1.2 landscape | (defined but unused — dramatic page closer if ever needed) |

The grid uses `grid-auto-flow: dense` so smaller items fill gaps that features can't accommodate. **No empty cells should appear in the final layout.**

For LANDSCAPE source photos that need to appear PORTRAIT in the grid, **rotate the source 90° clockwise** — don't crop the sides (the composition usually breaks). PowerShell pattern:

```powershell
$img = [System.Drawing.Image]::FromFile($src)
$img.RotateFlip([System.Drawing.RotateFlipType]::Rotate90FlipNone)
# then resize and save as before
```

If the rotated direction looks upside-down, use `Rotate270FlipNone` (counter-clockwise) instead.

## Preview server

```
preview_start name=kanya-hunt
```

Configured in `G:\My Drive\Kanya Hunt\.claude\launch.json` (port 3458). Suzaan can open `http://localhost:3458` in her browser. After file changes, just reload — no server restart needed.

To force a cache-busted reload via `preview_eval`:

```javascript
window.location.href = '/path.html?t=' + Date.now()
```

## What's still PENDING from Suzaan/Kanya

Treat each of these as a placeholder you'll find scattered across pages:

| Placeholder | What you'll find | Real value needed |
|-------------|------------------|-------------------|
| WhatsApp number | `+27 XX XXX XXXX` and `wa.me/27XXXXXXXXX` | The real number when Kanya provides |
| Price anchor | `R[X] for up to [Y] guests` *(in index.html contact form)* | Actual minimum, e.g. `R8,500 for 50 guests` |
| Real reviews | (already removed; section will be re-added once 3-4 testimonials are collected) | 3-4 short client testimonials |

When Suzaan provides any of these, do a single find-and-replace across all 8 HTML pages.

**WhatsApp number appears in these files:** `chocolate-weddings.html`, `white-chocolate-weddings.html`, `celebration-cakes.html`, `croquembouche-minis.html`, `buttercream-sugar-art.html`, `weekend-cakes.html`, `gallery.html`, `index.html` — replace `27XXXXXXXXX` and `+27 XX XXX XXXX` in all of them at once.

## Workflow when Suzaan sends photo picks

1. Suzaan will say something like *"For §1.2 white chocolate: definitely 1234, 5678, eve&tom2; maybe 002, 3947, 1743, etc."* Sometimes she'll paste a table screenshot.
2. **Map her codes to actual filenames** — she uses shortened codes (e.g., `2386` for `IMG_2386.JPG`, `PB32` for `PB (32).jpg`). Use PowerShell `Get-ChildItem -Filter "*pattern*"` to find them.
3. **Check dimensions** for each — flag any photos under ~1500px long-edge as gallery-only (not hero).
4. **For her "Definitely" picks** — verify against the 6 criteria. Be honest if any fail. Suzaan WANTS that feedback.
5. **For her "Maybe" picks** — you choose the strongest based on criteria, up to the page's slot limit.
6. **Use a general-purpose agent for batch photo review** when there are >5 photos. The agent reads images efficiently and returns a structured shortlist with slot assignments. Costs less context than viewing all photos yourself in the main thread.
7. **Optimize each approved photo** with the script.
8. **Update the HTML** — replace placeholder divs with real `<img>` tags, slot by slot.
9. **Reload the preview** and screenshot the result for Suzaan.
10. **Be ready for swaps** — Suzaan often asks for a photo to be removed, rotated, or swapped after seeing the result. The optimizer script handles re-processing easily.

## Per-page image slot counts (current — 2026-05-26)

| Page | Slots | Status |
|------|-------|--------|
| `index.html` | 10 | ✅ — hero + 3 §01 wedding cards + 2 §02 special-occ cards + 4 Instagram + condensed-about portrait |
| `about.html` | 4 + mother arched portrait | ✅ — Afrikaans quote band + 2×2 grid + mother portrait + bio |
| `chocolate-weddings.html` | 14 | ✅ |
| `white-chocolate-weddings.html` | 15 | ✅ |
| `celebration-cakes.html` | 11 | ✅ |
| `croquembouche-minis.html` | 9 | ✅ |
| `buttercream-sugar-art.html` | 12 | ✅ |
| `weekend-cakes.html` | 18 | ✅ |
| `gallery.html` *(nav label "Weddings")* | 15 | ✅ |

**Total: ~108 photo slots, all filled.** Full image-by-image inventory with alt text and captions lives in `IMAGE_INVENTORY.md` at the repo root — Suzaan uses it for Kanya's description review.

**Remaining open content placeholders** (not image work):
- WhatsApp number `27XXXXXXXXX` — appears in all 9 HTML files; find/replace globally when Kanya provides the real number
- Pricing anchor — no longer on the homepage (the old `R[X] for up to [Y] guests` note was removed when Say Hello was restructured). Will be re-introduced under a future FAQ section
- Real client testimonials — reviews section is currently off the site, re-add when Kanya provides 3-4 real reviews
- Designer-made logo — Kanya is currently typography-only in the nav; a photographic logo was tried and reverted

### Important structural facts (as of 2026-05-27)
- Site has **9 pages**.
- **Nav across all 9 pages**: `MY CAKES · WEDDINGS · ABOUT ME · THE KITCHEN · CONTACT` (+ Enquire Now CTA).
- Homepage about section is **condensed**: bio + chocolate quote + single Kanya portrait (aspect-ratio 21/9, object-position center 75%). Full bio lives on `about.html`.
- **Hero has ONE CTA** (`Commission a Cake`). On mobile, hero eyebrow drops "Bespoke" and breaks "Cape Town" onto its own line.
- **Homepage `What I Create`** is two sections:
  - §01 Wedding Cakes (3 cards, full-width grid): Couverture Chocolate / White Couverture / Buttercream & Sugar Art
  - §02 Special Occasions (2 cards, constrained to max-width 48% centred, smaller text — deliberate hierarchy): Celebration Cakes / Petite Creations
- **Say Hello / Contact section is a centred single-column form** (max-width 620px). No contact-details grid, no image, no pricing note, no 24-hour-response note. Bottom CTAs: `Send Enquiry → · or · WhatsApp Kanya` (both dark primary).
- **`How It Works` section is gone** entirely. Don't reintroduce.
- **Weekend Cakes (The Kitchen)** has the `Join the List` CTA section directly under the hero (above the gallery), with TWO primary CTAs side-by-side: `Join the WhatsApp List` + `View the Koekrun weekly menu` (Instagram).
- **Weekend Cakes copy** (as of 2026-05-27): sixteen recipes in rotation, menu announced Monday, pre-orders close midday Wednesday, Friday Koekrun delivery, collection from 4 Starfish Way Atlantic Beach Estate Melkbosstrand, priced from R975/cake (16 portions).
- Footer Portfolios column has **two sub-groups** (`Wedding & Commissions` + `The Kitchen`); separate `Find Kanya` column. **Koekedoor Season 2 Facebook link removed everywhere** — not maintained.
- **Bespoke reduction**: the word "bespoke" appears in exactly ONE place site-wide — the hero eyebrow on `index.html:695` ("Bespoke Couverture Cake Artist · Cape Town"). Everywhere else uses "made to order" / "handcrafted" / "commissioned" / "fine couverture" / "Special Occasions".
- **Homepage cards use separate files from portfolio heroes**: `home-cw-card.jpg` (cropped 600×720px portrait, grey panels removed) for §01 chocolate card vs `cw-01-hero.jpg` for the chocolate-weddings portfolio page hero. Same pattern for White Couverture: `home-ww-card.jpg` vs `ww-01-gold-orchid.jpg`.

### about.html layout — current architecture (2026-05-27)
This page was substantially restructured. Do not revert without understanding the history.

- **Credential strip removed** — the 4-column bar (Craft / Credentials / Location / Enquiries) no longer exists. Don't reintroduce.
- **No "Commission Your Cake" button** in the bio section. The page-level CTA is the `portfolio-cta` section at the bottom ("Let's create something extraordinary").
- **2×2 image grid uses CSS float, not a grid column.** `.about-image-grid` floats left at 50% minus gap. `.about-main-inner` is a simple block with `overflow: hidden` clearfix. This allows the bio text to wrap beside the images and then flow underneath — solving the tall-portrait-cell problem without leaving a gap. Images are `aspect-ratio: 1/1` (square).
- **Mother portrait + "I was four years old" intro**: wrapped in `.about-bio-portrait-row` flex row — side by side on BOTH desktop (gap 1.6rem, portrait 160px) and mobile (gap 0.9rem, portrait 110px). Do NOT revert to column stacking on mobile.
- **Section padding**: `.about-main` has `padding: 4rem 3.5rem 0` (no bottom padding — bio text ends close to next section). `#position` has `padding: 2.5rem 3.5rem 4rem`.
- **Mobile image grid**: on `max-width: 900px`, float is cancelled (`float: none; width: 100%`), grid reverts to `height: 360px` with `height: 100%` images.

### Orphan files in `images/`
Cleaned up 2026-05-20. Folder currently contains only referenced files. Don't expect orphans here unless something was just swapped.

## Strategic don'ts

- ❌ Don't put buttercream or fondant work in any of the §1 Wedding Cake **portfolio pages** (`chocolate-weddings.html` / `white-chocolate-weddings.html`). Despite the §01 homepage card grouping, the portfolio pages themselves stay chocolate-only. The "exclusively couverture chocolate" positioning is the brand's competitive moat.
- ❌ Don't reintroduce "Kitchen Cakes" or "Hunt House Kitchen" anywhere. The word `Kitchen` survives only as the nav label pointing to `weekend-cakes.html`.
- ❌ Don't reintroduce the **How It Works** section or `#order` CSS — removed entirely on 2026-05-26.
- ❌ Don't reintroduce "bespoke" anywhere except the hero eyebrow on `index.html:695`. Use "made to order" / "handcrafted" / "commissioned" / "fine couverture" instead.
- ❌ Don't add the contact-details grid (WhatsApp/Email/Instagram/Location) back into Say Hello — those lines live in the footer Contact column on every page now.
- ❌ Don't normalise the §02 Special Occasions card size to match §01 on desktop. The size difference IS the visual hierarchy.
- ❌ Don't add a photographic image as the nav logo. Tested 2026-05-26, doesn't read at 40px.
- ❌ Don't reintroduce the Koekedoor Season 2 Facebook link — no longer maintained.
- ❌ Don't add testimonial cards until Suzaan provides 3-4 real client reviews. Placeholder reviews are worse than none.
- ❌ Don't promise a Collaborations page — deferred until later.
- ❌ Don't rename portfolio pages or change the navigation labels without checking with Suzaan first.

## Git workflow

We commit + push to `origin/main` as save-points. **Suzaan has explicitly authorised pushing to GitHub Pages on every change** — the live URL is `https://suzaanloots-web.github.io`. You don't need to ask before each push; just do it after a sensible chunk of work.

Use `git log --oneline -10` to see the latest. The site has been live for many iterations since 2026-05-20.

## When to escalate back to Opus 4.7

Switch back to Opus for:
- Brand-voice copywriting (real testimonials integration, refined price anchor wording, any new copy decisions)
- Adding the Collaborations page when Suzaan is ready
- Pre-deploy final review before pushing to GitHub Pages
- Any major architectural change (new offerings, new page types)
- If you're stuck on a strategy question and need fresh thinking
