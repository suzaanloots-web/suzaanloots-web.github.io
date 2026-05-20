# Session Handoff — Kanya Hunt Website
**Last updated:** 2026-05-20 (evening, by Sonnet 4.6)
**Live URL:** https://suzaanloots-web.github.io

## Read this first

**Suzaan Loots** runs the project. She is **non-technical** — plain English always, no code dumps. She prefers natural conversation. Use `AskUserQuestion` sparingly.

She has explicitly authorised pushing to GitHub Pages — every commit can be pushed straight to `origin/main` without asking. But still confirm before destructive operations.

Full context for the agent: `CLAUDE.md` in this folder (brand positioning, photo curation criteria, optimizer usage, the don'ts list).

---

## Git status

Branch `main` is **fully up to date with `origin/main`**. Working tree is clean. All work committed and pushed.

Most recent commits (high level):
- Instagram row: 4 curated tiles (white peony, autumn roses, ribbon crown, chocolate embrace)
- Contact section: single sharp chocolate ganache image (replaces broken two-image overlay)
- 59 orphan files cleaned out of `images/` (~7.3 MB freed)
- About gallery: redesigned as asymmetric 2x2 with signature chocolate-rose hands image
- Homepage hero: single full-bleed cinematic with Ken Burns zoom (PB 32 sculptural chocolate cake)
- Multiple iterations on white couverture offering card (settled on `ww-offering.jpg` — IMG_f8f5232a re-cropped to remove stand leg)
- Mobile responsive fixes: portrait aspect ratio on gallery items, hover captions hidden on touchscreens

---

## The site as it currently stands

**Hero (homepage):** Single full-bleed dark sculptural cake (PB 32) with slow 24s Ken Burns zoom. Cream text overlay on the left, scroll cue at the bottom. Mobile stacks image with bottom-anchored text overlay.

**About section ("Hello, I'm Kanya"):** Asymmetric 2x2 gallery on the left (signature hands+chocolate-rose top-left, bundt-lady top-right, kitchen-lady bottom-left, laughing-lady bottom-right) with Kanya's story + mother portrait on the right.

**Offering cards (Bespoke Occasions row):** 6 cards — Couverture Chocolate, White Couverture, Celebration Cakes, Petite Creations, Buttercream & Sugar Art, Weekend Cakes. All using on-brand images with consistent silhouettes/backgrounds. White couverture and buttercream cards have inline `object-position` tweaks.

**Portfolio pages:** All 7 fully populated with real photos. Mobile gallery items render as portrait 3:4 (not the legacy landscape 4:3) — that fix is in `portfolio-style.css`.

**Contact section ("Let's create something extraordinary"):** Single sharp image of chocolate ganache cake with sculpted sails on silver pedestal (IMG_9503 → `home-contact.jpg`).

**Instagram row:** 4 curated 500x500 tiles. The previous broken two-image overlay setup was removed.

---

## What's still pending

### Real client content (waiting on Suzaan/Kanya)
| Placeholder | Where to find it | Replace with |
|-------------|------------------|--------------|
| WhatsApp number | `+27 XX XXX XXXX` and `wa.me/27XXXXXXXXX` across all 8 HTML files | Real number when Kanya provides |
| Price anchor | `R[X] for up to [Y] guests` in `index.html` contact form | Real minimum + guest count |
| Testimonials | Section already removed; will re-add when 3-4 reviews collected | 3-4 short client reviews |

### Open concerns from prior sessions
1. **Croquembouche & Minis page** — `cm-02-choc-cylinders.jpg` is mis-captioned (image actually shows chocolate-dipped strawberries, not cylinders). Worth a caption/alt rewrite or swap.
2. **Croquembouche & Minis page** — `cm-06-hands-cupcake.jpg` is a portrait photo in a `feature-wide` (landscape) slot — it's cropped. Could swap for a natively landscape photo.

### Strategic next-step ideas (none urgent)
- Add a Real Weddings testimonial block once reviews are collected
- Consider adding meta-description and OG image to each portfolio page (currently uses generic hero_01 ref which was deleted — should be updated)

---

## Site structure quick map

```
G:\My Drive\Kanya Hunt\Github\hunthouse-website\
├── index.html                        homepage
├── chocolate-weddings.html           §1 dark couverture portfolio (14 images, done)
├── white-chocolate-weddings.html     §1 white couverture portfolio (14 images, done)
├── celebration-cakes.html            §2 celebrations (10 images, done)
├── croquembouche-minis.html          §2 petite (12 images, done — 2 open concerns above)
├── buttercream-sugar-art.html        §2 buttercream (11 images, done)
├── weekend-cakes.html                §2 weekend (16 images, done)
├── gallery.html                      Real Weddings (15 images, done)
├── portfolio-style.css               shared CSS for all 7 sub-pages
├── scripts/optimize-image.ps1        image optimizer
├── images/                           108 referenced files, ~16.6 MB total
└── chocolate-pour-web.mp4            unused; was considered for hero video — see note below
```

---

## Image naming conventions

- `home-XX-name` — homepage images (hero, about, contact)
- `home-hero-pb32.jpg` — current single hero image
- `home-ab-XX-name.jpg` — about section gallery (01-bundt, 02-laughing, 03-kitchen, 04-mother, 05-signature)
- `home-contact.jpg` — contact section feature
- `home-insta-XX-name.jpg` — Instagram preview row (4 tiles)
- `cw-XX-name` — chocolate weddings
- `ww-XX-name` — white chocolate weddings (plus `ww-offering.jpg` for homepage card)
- `cc-XX-name` — celebration cakes
- `cm-XX-name` — croquembouche & minis
- `bs-XX-name` — buttercream & sugar art
- `wc-XX-name` — weekend cakes (plus `wc-offering.jpg` for homepage card)
- `rw-XX-name` — real weddings gallery

**Cache-busting:** Always append `?v=N` to image src. Bump N when overwriting an image file in the same session.

---

## How to work with Suzaan

- She sends photo picks as shortened codes (e.g. `2386` = `IMG_2386.JPG`, `PB32` = `PB (32).jpg`, `f8f5232a` = the UUID-named file). Use `Get-ChildItem -Filter "*pattern*"` to resolve.
- She has "Definitely" and "Maybe" lists. For Definitelys: check against the 6 photo criteria honestly — flag anything that fails (she wants real feedback). For Maybes: pick the strongest up to the slot count.
- For batch reviews of >5 photos, delegate to a general-purpose sub-agent — it conserves main-thread context.
- She iterates a lot. Expect rotation requests, swaps, removals after seeing the rendered page. Hard refreshes (`Ctrl+Shift+R`) are sometimes needed for her to see CSS changes.
- The preview server (`kanya-hunt`, port 3458) is configured. The preview pane in Claude Code can only show the page at its pane width (often <900px) so it renders the mobile layout. For desktop layouts, take screenshots via the preview tool at explicit widths (e.g. 1440x900) or have her check the live site.

---

## Preview server quick start

```
preview_start name=kanya-hunt
```
Then in the browser: `http://localhost:3458/index.html`

To force desktop dimensions when testing: `preview_resize width=1440 height=900`
To check mobile: `preview_resize preset=mobile`

---

## When to escalate to Opus

- Brand-voice copywriting (real testimonials integration, new copy decisions)
- Architectural changes (new pages, new offerings, restructure)
- Pre-deploy final review before a major content addition
- Anything where you're stuck on a strategy question and need fresh thinking

For everything else — image swaps, captions, layout iteration, photo curation, mobile bug fixes — Sonnet 4.6 is the right tool.

---

## Notable decisions logged from today's session

- **Hero design:** Rejected the slideshow approach entirely. Single full-bleed image with subtle Ken Burns zoom is the final pattern. Mobile uses dark gradient overlay + bottom-anchored text. PB 32 (sculptural chocolate on terracotta) is the chosen image because — as a single hero, dark drama becomes the brand statement rather than an outlier.
- **About gallery:** Switched from 3-image asymmetric (one tall left + 2 right) to 4-image asymmetric 2x2 with varied row heights. The signature image (Chocolate-245, hands cradling chocolate-rose) is the top-left feature.
- **Mobile gallery aspect ratio:** Was `4/3` landscape (cropped portrait cakes badly), now `3/4` portrait. Critical fix in `portfolio-style.css`.
- **Hover captions on touchscreens:** Hidden via `@media (hover: none)` — they were sticking after tap on mobile.
- **`chocolate-pour-web.mp4`:** Considered for hero video but rejected by Suzaan. Don't propose it again.
- **The "v2 contained-frame prototype" approach:** Was tried and rejected by Suzaan because it looked too sparse on her wide monitor. Don't propose this again either. Stick with full-bleed for hero.
