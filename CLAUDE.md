# Kanya Hunt website — agent handover notes

> Last updated by Opus 4.7 (1M context), 2026-05-19.
> The strategic and architectural work is done. From here it's executing the established pattern — slotting Kanya's photo selections into portfolio pages, verifying against the 6 criteria, and previewing.

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

## Per-page image slot counts (from the placeholders)

| Page | Slots |
|------|-------|
| `chocolate-weddings.html` | 14 ✅ DONE |
| `white-chocolate-weddings.html` | 14 |
| `celebration-cakes.html` | 10 |
| `croquembouche-minis.html` | 8 |
| `buttercream-sugar-art.html` | 10 |
| `weekend-cakes.html` | 16 |
| `gallery.html` *(Real Weddings)* | 15 |
| Homepage slots (hero ×4, about ×1, gallery ×3, offering cards ×6, contact frame ×2, Instagram ×4) | ~20 |

**Total: ~107 photo slots across the site.**

## Strategic don'ts

- ❌ Don't put buttercream or fondant work in any of the §1 Wedding Cake portfolios (chocolate weddings or white chocolate weddings). It breaks the "exclusively couverture chocolate" positioning that the entire 90-day strategy is built around.
- ❌ Don't reintroduce "Kitchen Cakes" anywhere. The roadmap explicitly retires "Hunt House Kitchen" because the word *Kitchen* creates a ceiling on luxury positioning.
- ❌ Don't add testimonial cards back to the site until Suzaan provides real client reviews. The roadmap is firm: placeholder reviews are worse than none.
- ❌ Don't promise a Collaborations page — that's been explicitly deferred until later. Soft mentions of editorial collaborations in the Real Weddings page are fine; a dedicated planner-CTA page is not.
- ❌ Don't rename portfolio pages or change the navigation labels without checking with Suzaan first.

## Git workflow

We commit periodically as save-points. Suzaan hasn't been pushing to GitHub yet — that happens when the photos and content are finalized. **Don't push to origin without explicit permission.**

Recent commits *(via `git log --oneline`)*:
- `22219fb Restructure site into multi-page architecture`
- `7d428c5 Remove study folder - moved to Gesk-kw1 repo`

## When to escalate back to Opus 4.7

Switch back to Opus for:
- Brand-voice copywriting (real testimonials integration, refined price anchor wording, any new copy decisions)
- Adding the Collaborations page when Suzaan is ready
- Pre-deploy final review before pushing to GitHub Pages
- Any major architectural change (new offerings, new page types)
- If you're stuck on a strategy question and need fresh thinking
