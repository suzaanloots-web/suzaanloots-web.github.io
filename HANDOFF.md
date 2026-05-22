# Session Handoff — Kanya Hunt Website
**Last updated:** 2026-05-22 (afternoon, by Opus 4.7 — handing to Sonnet 4.6)
**Live URL:** https://suzaanloots-web.github.io

---

## Read this first

**Suzaan Loots** runs the project. Non-technical — plain English always, no code dumps. Prefers natural conversation. Use `AskUserQuestion` sparingly.

**Push-on-every-change authorised.** Push commits straight to `origin/main` without asking. Still confirm before destructive operations (rm, force push, branch delete).

Foundational context: `CLAUDE.md` in this folder (brand positioning, photo curation criteria, optimizer usage, don'ts list).

---

## Git status

Branch `main` is **fully up to date with `origin/main`**. Working tree is clean. All work committed and pushed.

---

## What today (2026-05-22) shipped — 13 commits

In sequence, oldest first:

| # | Commit | What it did |
|---|---|---|
| 1 | `5f79dcb` | Offerings intro copy fix: "quiet Sunday cake" → "intimate celebration cake" |
| 2 | `455e1f2` | File rename: `cm-11-heart-chocs.jpg` → `cm-12-heart-chocs.jpg` (fixed duplicate cm-11 file number) |
| 3 | `e3f163b` | **Commit A** — Built new `about.html`: H1, Afrikaans quote band, 2×2 image grid, mother arched portrait, bio, credential strip, "A Different Kind of Cake" positioning section, CTA, footer with Find Kanya column. About marked active in nav. |
| 4 | `e227dd3` | **Commit B** — Added "About" as 3rd nav item across remaining 8 pages (desktop + mobile menu). Renamed footer "Find the Work" → "Find Kanya" globally with About Kanya as first link. |
| 5 | `2c732b6` | **Commit C** — Collapsed homepage about section to condensed bio + 5-image carousel (6s rotation). Removed full bio, image grid, mother portrait. |
| 6 | `377a6f8` | Moved Afrikaans quote from homepage to about.html. Homepage #quote-strip restructured to clean full-width credentials-only row. |
| 7 | `201abb8` | About 2×2 image grid: proper framed-photo treatment (gap 12px, radius 6px, drop shadow, per-image object-position tuning). |
| 8 | `5d34050` | Carousel frame: match offering card treatment (radius 8px + shadow). |
| 9 | `945a255` | Replaced carousel with single portrait IMG_2652 + longer reflective bio + chocolate quote moved from about.html. Removed carousel JS. |
| 10 | `f95b880` | Three small fixes: hero eyebrow blush→linen for legibility; removed WhatsApp Kanya from hero (only Commission a Cake remains); WhatsApp moved to contact section below details grid; renamed "Real Weddings" → "Weddings" in nav + footer across all 9 pages. |
| 11 | `9008f2a` | **Critical bug fix** — orphaned `#about { display:grid }` CSS from the original about-gallery design was silently constraining the new `.about-condensed-inner` to ~657px instead of using its 1440px max-width. Removed all orphan `.about-*` / `.ag-*` CSS rules (desktop and mobile). Widened max-width to 1440px, increased photo height to 480px. |
| 12 | `fcf5631` | Swap to landscape portrait IMG_2296 (Kanya in headwrap, 16:9). Switched grid `align-items: center` → default `stretch`. Photo height became `min-height: 360px`. |
| 13 | `1d93428` | Reduce photo min-height from 360px → 240px so the text content drives row height. Result: text and photo end at exactly the same line — no empty space below the "More about Kanya" link. |

---

## The site as it currently stands

### Pages (9 total)
1. **`index.html`** — homepage
2. **`about.html`** — new dedicated story page
3. `chocolate-weddings.html`, `white-chocolate-weddings.html`, `celebration-cakes.html`, `croquembouche-minis.html`, `buttercream-sugar-art.html`, `weekend-cakes.html` — 6 portfolio sub-pages
4. `gallery.html` — Real Weddings

### Homepage flow (top to bottom)

1. **Hero** — single full-bleed dark sculptural cake image (Ken Burns zoom). Eyebrow "BESPOKE COUVERTURE CAKE ARTIST · CAPE TOWN" in linen (was blush — now readable). Title "Where chocolate becomes art" in cream serif with blush italic em. Single CTA: `Commission a Cake` (WhatsApp moved to contact section).
2. **Credentials strip** — full-width 4-column row (Craft · Credentials · Location · Enquiries). Linen background. The Afrikaans quote that used to share this strip is now on about.html.
3. **Condensed about (#about)** — two columns, max-width 1440px, gap 4rem, `align-items: stretch` so columns are exactly equal height:
   - **Left**: longer reflective bio leading with *"Cake, for me, begins with a question — what do you want people to feel when they taste it?"* + the chocolate quote *"Chocolate is not just an ingredient. It is everything I want to say that words cannot."* (rose left-border) + **MORE ABOUT KANYA →** text link
   - **Right**: single portrait `home-ab-kanya-portrait.jpg?v=2` (IMG_2296, 16:9 landscape of Kanya in headwrap) with `min-height: 240px` and `object-position: center`
4. **What I Create** — two sections:
   - Wedding Cakes (2 cards: Dark Couverture + White Couverture)
   - Bespoke Occasions (3 cards: Celebration / Petite / Buttercream & Sugar Art)
5. **Weekend Strip** — quiet framed noticeboard (linen section + parchment inner card + gold hairline border + text-link CTAs). See [[feedback_weekend_strip_pattern]] in persistent memory.
6. **Wedding Cakes & Bespoke Commissions / How it works** — re-entry signal after the Weekend Strip detour (white background, full-width).
7. **Contact** — form on left, "Say Hello" on right with WhatsApp / Email / Instagram / Location grid + **WhatsApp Kanya** button below.
8. **Instagram + Footer** — footer Portfolios column has two sub-groups ("Wedding & Bespoke" + "The Kitchen"); separate "Find Kanya" column with About Kanya as first link.

### Navigation (all 9 pages)

Desktop nav + mobile hamburger menu: **Creations · Weddings · About · The Kitchen · Contact** + Enquire Now CTA.

On `about.html`, the About link has `class="active"`. On `gallery.html`, the Weddings link has `class="active"` on desktop nav only (mobile menu doesn't — minor inconsistency, low priority).

### about.html structure (top to bottom)

1. Standard nav (About marked active)
2. **Page hero strip** — H1 "The Story Behind *the Chocolate*" + intro line
3. **Afrikaans quote band** — centred editorial band with the Afrikaans blockquote + English translation
4. **Main about** — two-column: 2×2 image grid (signature top-left, kitchen top-right, laughing bottom-left, bundt bottom-right with proper framed-photo treatment — 12px gap, 6px radius, drop shadow, per-image object-position) + biography column with mother arched portrait, intro paragraph (italic Cormorant with gold left-border), two body paragraphs, run-and-cycle line, "Commission Your Cake" btn-primary
5. **Credential strip** — 4 cards (Craft · Credentials · Location · Enquiries), full-width row on linen
6. **A Different Kind of Cake** — two-column positioning section
7. **Final CTA** — "Let's create something *extraordinary*" + Commission a Cake + WhatsApp Kanya buttons
8. Standard footer with Find Kanya column

Mobile breakpoint at 900px throughout.

---

## What's still pending

### From Kanya (placeholders to fill)

| Placeholder | Where | Replace with |
|---|---|---|
| WhatsApp number | `+27 XX XXX XXXX` and `wa.me/27XXXXXXXXX` across all 9 HTML files | Real Kanya WhatsApp Business number |
| Price anchor | `R[X] for up to [Y] guests` in `index.html` contact form | Real minimum + guest count |
| Testimonials | Section already removed; will re-add when 3-4 reviews collected | 3-4 short client reviews |

### Launch action (Suzaan/Kanya, not the implementer)

Before sharing the site with any wedding planner, Kanya must send this broadcast to her 1000+ existing Friday cake clients **first**:

> *"Quick note — I've built a website, mostly for the wedding side of my work, but I wanted you to know that nothing changes for the Friday cake list. Same WhatsApp number, Wednesday menu, Friday delivery — exactly as always. If you'd like to browse the rotation, the Friday cakes have their own page here: https://suzaanloots-web.github.io/weekend-cakes.html"*

The opening line ("nothing changes for the Friday cake list") is doing the load-bearing work. The strategy depends on this broadcast routing existing clients directly to weekend-cakes.html.

### Open concerns from prior sessions (low priority)

1. **Petite Creations** — `cm-02-choc-cylinders.jpg` mis-captioned (shows chocolate-dipped strawberries, not cylinders). Could swap caption + alt or replace image.
2. **Petite Creations** — `cm-06-hands-cupcake.jpg` portrait photo in a `feature-wide` landscape slot — cropped. Swap candidate.
3. **Gallery active class** — `gallery.html` desktop nav has `class="active"` on Weddings, mobile menu doesn't. Minor inconsistency.
4. **weekend-cakes.html** — The Kitchen link points to itself (self-referencing). Same pattern as Real Weddings → gallery.html on gallery.html. Could add `class="active"` for the polish, but harmless as-is.

---

## Image naming conventions

- `home-XX-name` — homepage images
- `home-hero-pb32.jpg` — current single hero image (sculptural dark chocolate on terracotta)
- `home-ab-XX-name.jpg` — about gallery (01-bundt, 02-laughing, 03-kitchen, 04-mother, 05-signature)
- `home-ab-kanya-portrait.jpg?v=2` — current homepage condensed about photo (IMG_2296 — Kanya in headwrap, landscape)
- `home-contact.jpg` — contact section feature
- `home-insta-XX-name.jpg` — Instagram row (4 tiles)
- `cw-XX-name` — chocolate weddings
- `ww-XX-name` — white chocolate weddings (plus `ww-offering.jpg`)
- `cc-XX-name` — celebration cakes
- `cm-XX-name` — croquembouche & minis (cm-12 is heart-chocs as of today — no more duplicate cm-11)
- `bs-XX-name` — buttercream & sugar art
- `wc-XX-name` — weekend cakes (`wc-offering.jpg` is no longer used on homepage but stays on weekend-cakes.html)
- `rw-XX-name` — real weddings (gallery)

**Cache-busting:** Always append `?v=N` to image src. Bump N when overwriting an image file.

---

## Preview server quick start

```
preview_start name=kanya-hunt
```
Port 3458. Visit `http://localhost:3458/index.html`. For desktop testing: `preview_resize width=1440 height=900`. For mobile: `preview_resize preset=mobile`.

Note: the preview pane in Claude Code is often narrower than 900px so it shows the mobile media query. Use explicit `preview_resize` for desktop layouts.

---

## Standing architectural rules (banked)

1. **Detour-section re-entry signal rule** — every quiet-aside section must be followed by an explicit reanchoring eyebrow + intro in the next section. The Weekend Strip + "Wedding Cakes & Bespoke Commissions" eyebrow is the model.
2. **Framed-noticeboard pattern** — for any future quiet aside: linen section + parchment inner card + hairline gold border + text-link CTAs (NOT buttons). Reusable.
3. **Mobile menu JS pattern** — only `preventDefault()` for in-page anchors (`href` starting with `#`). External page links must navigate normally. (Critical bug fix from yesterday — index.html had the buggy version that silently broke The Kitchen + Real Weddings on mobile.)
4. **WhatsApp link standardisation** — every `wa.me` link uses `?text=Hi%20Kanya%2C%20I%27d%20like%20to%20join%20the%20Friday%20cake%20list` (pre-filled message: *"Hi Kanya, I'd like to join the Friday cake list"*).
5. **Watch out for orphaned ID-targeted CSS** — leaving dead `.class` CSS is safe, but leaving dead `#id` CSS that reuses element IDs across redesigns can silently break layout. The `#about { display:grid }` orphan today constrained the new condensed section to half its intended width before I caught it. Always grep `#about|#order|etc` after restructuring.

---

## How to work with Suzaan

- She sends photo picks as shortened codes: `2386` → `IMG_2386.JPG`, `PB32` → `PB (32).jpg`, `f8f5232a` → the UUID-named file. Use `Get-ChildItem -Filter "*pattern*"` to resolve.
- She has "Definitely" and "Maybe" lists. For Definitelys: check against the 6 photo criteria honestly — flag failures. For Maybes: pick the strongest up to slot count.
- For batch reviews of >5 photos, delegate to a general-purpose sub-agent.
- She iterates a lot — expect rotation requests, swaps, refinements after seeing the rendered page. Hard refresh (`Ctrl+Shift+R`) is sometimes needed.
- Communicates visually — often sends screenshots with annotations (circles, arrows). Read those carefully; the annotations matter more than the surrounding text.

---

## Site structure quick map

```
G:\My Drive\Kanya Hunt\Github\hunthouse-website\
├── index.html                        homepage (condensed about + carousel-replaced-with-portrait)
├── about.html                        NEW — full story page (Afrikaans quote + 2x2 grid + bio + position section)
├── chocolate-weddings.html           §1 dark couverture portfolio
├── white-chocolate-weddings.html     §1 white couverture portfolio
├── celebration-cakes.html            §2 celebrations
├── croquembouche-minis.html          §2 petite (cm-12 is heart-chocs as of today)
├── buttercream-sugar-art.html        §2 buttercream
├── weekend-cakes.html                §2 weekend cakes / "The Kitchen" target
├── gallery.html                      Real Weddings (nav label is "Weddings")
├── portfolio-style.css               shared CSS for portfolio pages
├── scripts/optimize-image.ps1        image optimizer
├── images/                           109 referenced files
└── chocolate-pour-web.mp4            unused; rejected for hero video
```

---

## When to escalate to Opus

- Brand-voice copywriting decisions
- Architectural changes (new pages, new sections, restructure)
- Pre-deploy strategic review before major content addition
- Anything where the strategy needs fresh thinking

For image swaps, captions, layout iteration, copy tweaks, mobile bug fixes — Sonnet 4.6 is the right tool.

---

## Notable decisions logged today

- **Dedicated about.html page** — full story moved off the homepage so visitors reach the wedding cake portfolio within 2 scrolls of the hero.
- **Two-document brief pattern reused** — strategic doc for Kanya + implementation spec for Claude Code worked again for Commit 7.
- **Homepage condensed about: single portrait beats carousel** — Suzaan rejected the auto-rotating carousel as "no context", replaced with single portrait of Kanya + longer reflective bio + chocolate quote.
- **IMG_2296 (landscape headwrap) chosen over IMG_2652** — better for matching a landscape container that aligns with text height via `align-items: stretch`.
- **"Real Weddings" tab → "Weddings"** — nav label only; gallery.html page H1 stays "Real Weddings".
- **Hero CTA simplified to one** — "Commission a Cake" only on hero. "WhatsApp Kanya" moved to the contact section below the details grid.
- **Hero eyebrow color** — changed from blush to linen for legibility against the dark hero.

---

## QA verification recommended on session pickup

Quick grep checks to confirm site state:

```bash
# Should all return clean — no remnants of old content:
grep -n "Sunday cake\|process is simple\|Ready to Begin\|Real Weddings</a>\|small list of regulars\|Chocolatier" *.html

# Should return matches showing the live state:
grep -n "Bespoke Couverture Cake Artist\|home-ab-kanya-portrait\|about.html" index.html
grep -c "About</a>" *.html   # should be 1+ on every page (nav + sometimes footer)
grep -c "Weddings</a>" *.html # should be 2+ on every page (desktop nav + mobile menu)
```

Visual verification (in browser):
- Homepage hero eyebrow readable in cream against dark image
- Single Commission a Cake button on hero (no WhatsApp button)
- Condensed about section: text + photo same height, no empty linen above/below
- about.html loads with Afrikaans quote, 2×2 grid framed photos, full bio
- Nav reads "Creations · Weddings · About · The Kitchen · Contact" on all 9 pages
- Footer Portfolios column has two sub-groups; separate "Find Kanya" column with About link
