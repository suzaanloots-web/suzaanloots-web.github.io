# Session Handoff — Kanya Hunt Website
**Last updated:** 2026-05-21 (afternoon, by Sonnet 4.6)
**Live URL:** https://suzaanloots-web.github.io

---

## Read this first

**Suzaan Loots** runs the project. She is **non-technical** — plain English always, no code dumps. She prefers natural conversation. Use `AskUserQuestion` sparingly.

**Push-on-every-change authorised.** Push commits straight to `origin/main` without asking. Still confirm before destructive operations (rm, force push, branch delete).

Full context for the agent: `CLAUDE.md` in this folder (brand positioning, photo curation criteria, optimizer usage, the don'ts list).

---

## Git status

Branch `main` is **fully up to date with `origin/main`**. Working tree is clean. All work committed and pushed.

### Today's 10 commits (most recent first)

| # | Commit | What it did |
|---|---|---|
| 10 | `aa85c6a` | Fix mobile menu navigation bug on index.html (preventDefault was blocking page navigation for The Kitchen + Real Weddings — JS now only intercepts in-page anchors) |
| 9 | `233b4c4` | Change #order background linen→white for clean paragraph break before Bespoke Commissions section |
| 8 | `eae9b18` | Stronger paragraph break + rename eyebrow to "Wedding Cakes & Bespoke Commissions" for explicit re-entry signal |
| 7 | `d2556f0` | Weekend Strip framed noticeboard — linen section background + parchment inner card with hairline gold border |
| 6 | `8e39d02` | Weekend Strip tone refinement — "A WhatsApp list worth being on — join it and it becomes part of your week" (replaces "small list of regulars") |
| 5 | `ca3e092` | Flow reanchor — "Ready to Begin?" → "Bespoke Commissions"; intro paragraph leads with "Every bespoke commission begins the same way" |
| 4 | `09c83fb` | Add "The Kitchen" nav item across all 8 pages; remove Section 02 breadcrumb + Send an Enquiry CTA from weekend-cakes.html |
| 3 | `019e162` | Bespoke grid 4→3 cols (Weekend removed); new Weekend Strip section with two text-link CTAs; footer Portfolios split into Wedding & Bespoke + The Kitchen sub-groups |
| 2 | `d866094` | Global wording: Chocolatier → Couverture Cake Artist (8 files, 20 instances) |
| 1 | `dbfa6c5` | Friday delivery correction on weekend-cakes.html (was Saturday) |

---

## The site as it currently stands

### Homepage flow (top to bottom)

1. **Hero** — single full-bleed dark sculptural cake image with slow Ken Burns zoom. Tagline reads "Bespoke Couverture Cake Artist · Cape Town". Two CTAs: Commission a Cake + WhatsApp Kanya (deliberately ambiguous).
2. **About — Hello, I'm Kanya** — asymmetric 2x2 photo gallery (signature chocolate-rose hands top-left). Kanya's story on the right with mother portrait.
3. **What I Create — Section 01: Wedding Cakes** — full visual weight (Dark Couverture + White Couverture cards).
4. **What I Create — Section 02: Bespoke Occasions** — 3-card grid (Celebration · Petite · Buttercream & Sugar Art). Weekend Cakes is NOT in this grid anymore.
5. **Weekend Strip** — quiet typographic noticeboard. Linen section background. Inside: centered parchment card with hairline gold border. Reads "The kitchen runs every week — commission or not" + ritual description + two text-link CTAs ("View the rotation →" + "Join the WhatsApp list →"). No image, no section number, no card grid styling.
6. **Wedding Cakes & Bespoke Commissions / How it works** — explicit re-entry signal after the Weekend Strip detour. White background. Three-step process (Tell me your vision → We design together → Your cake is created).
7. **Contact** — wedding commission enquiry form. Weekend Cakes option removed from occasion dropdown. White background.
8. **Instagram row + Footer** — Footer Portfolios column has two sub-groups: "Wedding & Bespoke" (6 links) + "The Kitchen" (Weekend Cakes only).

### Navigation across all 8 pages

Desktop nav + mobile hamburger menu both show: About · Creations · Real Weddings · **The Kitchen** · Contact

"The Kitchen" links to `weekend-cakes.html`. Mobile menu navigation JS bug was fixed today — preventDefault was blocking external links on the homepage; now only in-page anchors get intercepted.

### Strategic decisions banked

- **"Couverture Cake Artist"** replaces "Couverture Chocolatier" across the site. Kanya doesn't hold a formal chocolatier qualification, and her brand is built on authenticity. The word *couverture* does the specialist signalling work; *cake artist* is a defensible recognised term.
- **Weekend Cakes is intentionally demoted on the homepage** — quiet noticeboard rather than a 4th Bespoke card. Protects luxury wedding positioning from "is this a home baker?" perception while keeping the 1000+ existing Friday cake clients served by the persistent "The Kitchen" nav item + the dedicated `weekend-cakes.html` page.
- **The Kitchen nav item is on every page** — primary discovery mechanism for existing clients. WhatsApp broadcast (see below) provides a second direct route.
- **The Friday delivery fix was important** — `weekend-cakes.html` previously stated Saturday delivery which was incorrect business info.

---

## What's still pending — for Kanya

### Real client content (placeholders to fill)

| Placeholder | Where | Replace with |
|-------------|-------|--------------|
| WhatsApp number | `+27 XX XXX XXXX` and `wa.me/27XXXXXXXXX` across all 8 HTML files | Real Kanya WhatsApp Business number |
| Price anchor | `R[X] for up to [Y] guests` in `index.html` contact form | Real minimum + guest count |
| Testimonials | Section already removed; will re-add when 3-4 reviews collected | 3-4 short client reviews |

### Launch action — WhatsApp broadcast script

Before sharing the site with any wedding planner, Kanya must send this broadcast to her 1000+ existing Friday cake clients FIRST:

> *"Quick note — I've built a website, mostly for the wedding side of my work, but I wanted you to know that nothing changes for the Friday cake list. Same WhatsApp number, Wednesday menu, Friday delivery — exactly as always. If you'd like to browse the rotation, the Friday cakes have their own page here: https://suzaanloots-web.github.io/weekend-cakes.html"*

The opening line ("nothing changes for the Friday cake list") is doing the load-bearing work. The strategy depends on this broadcast routing existing clients directly to weekend-cakes.html so the homepage doesn't have to bend for them.

### Open concerns from prior sessions (not blocking)

1. **Croquembouche & Minis page** — `cm-02-choc-cylinders.jpg` is mis-captioned (image shows chocolate-dipped strawberries, not cylinders). Caption + alt text need updating, or swap image.
2. **Croquembouche & Minis page** — `cm-06-hands-cupcake.jpg` is a portrait photo in a `feature-wide` (landscape) slot — cropped. Could swap for a natively landscape photo.

### Minor UX polish (optional)

- `weekend-cakes.html` has "The Kitchen" nav link pointing to itself; clicking reloads the page. Same pattern as `gallery.html` → "Real Weddings" pointing to itself. Both could be polished with `class="active"` to indicate current page.

---

## How to work with Suzaan

- She sends photo picks as shortened codes (e.g. `2386` = `IMG_2386.JPG`, `PB32` = `PB (32).jpg`, `f8f5232a` = UUID-named file). Use `Get-ChildItem -Filter "*pattern*"` to resolve.
- She has "Definitely" and "Maybe" photo lists. For Definitelys: check against the 6 photo criteria honestly — flag failures. For Maybes: pick the strongest up to slot count.
- For batch reviews of >5 photos, delegate to a general-purpose sub-agent.
- She iterates a lot. Expect rotation requests, swaps, removals after seeing the rendered page. Hard refresh (`Ctrl+Shift+R`) is sometimes needed.
- The preview server (`kanya-hunt`, port 3458) is configured. The preview pane in Claude Code can only show the page at its pane width (often <900px) so it renders the mobile layout. For desktop layouts, take screenshots via the preview tool at explicit widths (`preview_resize width=1440 height=900`).

---

## Site structure quick map

```
G:\My Drive\Kanya Hunt\Github\hunthouse-website\
├── index.html                        homepage
├── chocolate-weddings.html           §1 dark couverture portfolio (14 images, DONE)
├── white-chocolate-weddings.html     §1 white couverture portfolio (14 images, DONE)
├── celebration-cakes.html            §2 celebrations (11 images, DONE)
├── croquembouche-minis.html          §2 petite (12 images, DONE — 2 open concerns)
├── buttercream-sugar-art.html        §2 buttercream (11 images, DONE)
├── weekend-cakes.html                §2 weekend → now "The Kitchen" (16 images, DONE)
├── gallery.html                      Real Weddings (15 images, DONE)
├── portfolio-style.css               shared CSS for all 7 sub-pages
├── scripts/optimize-image.ps1        image optimizer
├── images/                           109 referenced files, ~16.7 MB total
└── chocolate-pour-web.mp4            unused; was considered for hero video, rejected
```

---

## Image naming conventions

- `home-XX-name` — homepage images (hero, about, contact)
- `home-hero-pb32.jpg` — current single hero image (sculptural dark chocolate cake on terracotta)
- `home-ab-XX-name.jpg` — about section gallery (01-bundt, 02-laughing, 03-kitchen, 04-mother, 05-signature)
- `home-contact.jpg` — contact section feature
- `home-insta-XX-name.jpg` — Instagram preview row (4 tiles)
- `cw-XX-name` — chocolate weddings
- `ww-XX-name` — white chocolate weddings (plus `ww-offering.jpg` for homepage card)
- `cc-XX-name` — celebration cakes
- `cm-XX-name` — croquembouche & minis
- `bs-XX-name` — buttercream & sugar art
- `wc-XX-name` — weekend cakes (plus `wc-offering.jpg` — note: this card was REMOVED from the homepage Bespoke grid; image now only used on weekend-cakes.html)
- `rw-XX-name` — real weddings gallery

**Cache-busting:** Always append `?v=N` to image src. Bump N when overwriting an image file in the same session.

---

## Preview server quick start

```
preview_start name=kanya-hunt
```

Then in the browser: `http://localhost:3458/index.html`

For desktop layout testing: `preview_resize width=1440 height=900`
For mobile: `preview_resize preset=mobile`

---

## Standing architectural rules (banked from this session)

1. **Every "detour section" needs a corresponding "re-entry signal"** in the section that follows. The Weekend Strip is a detour (parchment card on linen, no images, different tone). Without re-anchoring, visitors lose context. The "Wedding Cakes & Bespoke Commissions" eyebrow + intro rewrite is the re-entry. Apply this pattern to any future detour-style sections.

2. **Quiet typographic asides should never look like product cards.** Use:
   - Linen section background
   - Inner card with parchment background + hairline gold border
   - No images
   - Text-link CTAs (underlined, caramel-toned italic), NOT button-styled
   - Reduced padding compared to surrounding sections
   - This is the "framed noticeboard" pattern.

3. **Mobile menu JS pattern: only intercept in-page anchors.**
   ```js
   if (href && href.charAt(0) === '#') { e.preventDefault(); /* scroll */ }
   else { closeMenu(); /* let browser navigate */ }
   ```
   The previous bug was `preventDefault()` on every link then `document.querySelector(href)` — which works for `#anchor` but fails silently for `weekend-cakes.html`. This bug only existed on `index.html`; the other 7 pages have a simpler closeMenu handler.

4. **WhatsApp link standardisation.** Every `wa.me` link should use the same pre-filled message: `Hi%20Kanya%2C%20I%27d%20like%20to%20join%20the%20Friday%20cake%20list`. Decoded: *"Hi Kanya, I'd like to join the Friday cake list."*

---

## When to escalate to Opus

- Brand-voice copywriting decisions (new testimonials integration, new copy)
- Architectural changes (new pages, new offerings, restructure)
- Pre-deploy strategic review before a major content addition
- Anything where the strategy needs fresh thinking

For everything else — image swaps, captions, layout iteration, photo curation, mobile bug fixes — Sonnet 4.6 is the right tool.

---

## Notable decisions logged today

- **Two-document brief pattern** — split implementation briefs into one strategic version for Kanya (plain language) and one technical version for Claude Code (full implementation spec). Worked well; reuse for any future complex change.
- **Chocolatier → Couverture Cake Artist** — final, applied globally. The word "Bespoke" preserved on the hero tagline.
- **Two CTAs on Weekend Strip** — Suzaan's call. "View the rotation →" + "Join the WhatsApp list →" both as understated text links, not buttons.
- **Mobile menu JS bug** — fixed on index.html only. Caught when Suzaan reported "The Kitchen" tap doing nothing on her Android device.
- **The site is NOT yet shared with anyone** — Kanya's previous web presence was a basic old-photos page (no relation to this build). When ready to share, the WhatsApp broadcast (above) goes out FIRST, then planner links.
