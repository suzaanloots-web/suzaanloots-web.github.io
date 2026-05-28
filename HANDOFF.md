# Session Handoff — Kanya Hunt Website
**Last updated:** 2026-05-27 (by Opus 4.7 — long session: migration + design polish + full SEO)
**Live URL:** https://kanyahunt.co.za ← LIVE, HTTPS enforced, cert covers apex + www.
**Repo:** https://github.com/suzaanloots-web/suzaanloots-web.github.io
**GitHub Pages also responds at:** https://suzaanloots-web.github.io (redirects to kanyahunt.co.za)

---

## Read this first

**Suzaan Loots** runs the project (Kanya's partner). Non-technical — plain English always, no code dumps. Prefers natural conversation. Use `AskUserQuestion` sparingly.

**Push-on-every-change is authorised.** Push to `origin/main` straight after each sensible chunk of work — no need to ask.

**Foundational context:** `CLAUDE.md` in this folder (brand positioning, photo curation criteria, optimizer usage, don'ts list). Also see persistent memory at `C:\Users\suzaa\.claude\projects\G--My-Drive-Kanya-Hunt\memory\` — especially `MEMORY.md` (index), `project_kanya_hunt.md`, `feedback_orphan_id_css.md`, `user_profile_suzaan_kanya_hunt.md`, `feedback_couverture_cake_artist.md`.

---

## Git status

Branch `main` is **fully up to date with `origin/main`**. Working tree is clean.

---

## What shipped this session (2026-05-27)

### Domain migration — kanyahunt.co.za is LIVE & COMPLETE
- `CNAME` file in repo root = `kanyahunt.co.za`
- **Xneelo DNS** (managed via Xneelo Web Hosting panel → Manage DNS, NOT the domain-page "Manage DNS" which 404s): 4 × A records (`@` → 185.199.108–111.153), `www` CNAME → `suzaanloots-web.github.io.`. Mail records (MX, mail A, imap/pop/smtp/relay CNAMEs, SPF TXT) left untouched — email still on Xneelo.
- GitHub Pages: custom domain `kanyahunt.co.za`, **Enforce HTTPS ✓**. GitHub auto-re-issued the Let's Encrypt cert at 19:10 so it now covers **both** `kanyahunt.co.za` AND `www.kanyahunt.co.za` (verified: www 301-redirects to apex with valid SSL).
- **Xneelo web hosting still active but unused** (site is on GitHub Pages). Suzaan may later call Xneelo to drop the web-hosting portion (keep domain + email). Not urgent.
- Note: GitHub's Pages UI created `Create CNAME`/`Delete CNAME` commits when the custom domain was toggled — pulled in via rebase, harmless.

### Reviews section added to homepage
- New `#reviews` section between Weekend Strip and Say Hello
- **Heading:** "SWEET TALK" (eyebrow) / "The cake conversations that followed" (display heading) / gold divider
- **4 real client cards (2×2 grid):**
  - Jomari — Wedding at Bosjes (Afrikaans review)
  - Seon — Event Interiors · Wedding Planner
  - Vash — Weekend Cake Client
  - Candice Chapman — Wedding at Vrede en Lust

### SEO & AI discoverability pass (completed this session)
- Canonical tags on all 10 pages pointing to `kanyahunt.co.za`
- JSON-LD schema: LocalBusiness on index.html, Person on about.html, Service on all portfolio pages, FAQPage on faq.html, CollectionPage on gallery.html
- `sitemap.xml` — all 10 pages with priority weights
- `robots.txt` — Allow all, Sitemap: https://kanyahunt.co.za/sitemap.xml
- `llms.txt` — AI agent discoverability file at site root
- Fixed truncated og:titles and missing og:images across multiple pages

### Contact form — Web3Forms integration
- Real form submission replacing fake `handleSubmit` that was never sending data
- POST to `https://api.web3forms.com/submit`
- Access key: `e9dd8d3a-722e-4012-bf77-669756089749`
- Redirect on success: `https://kanyahunt.co.za/thankyou.html`
- `thankyou.html` created (noindex, brand-styled, links back to index)
- **IMPORTANT:** Web3Forms activation email went to Kanya's junk mail — she found and clicked it. Form is active. Test again if form submissions aren't arriving.

### Other copy / structural changes
- WhatsApp number is REAL: `+27 82 375 5200` / `wa.me/27823755200` — across all 10 pages
- Nav "Weekend Cakes" (was "The Kitchen") across all pages
- Footer "WEEKEND CAKES" subgroup label (was "THE KITCHEN")
- Footer kanyahunt.co.za website link removed (domain was migrating — now it's the actual site)
- Bio updated to 3-paragraph version + pull quote moved under portrait
- Venue field changed from dropdown to free text in contact form
- Occasion dropdown: removed "Styled shoot / editorial"; renamed "Buttercream or Sugar Art" → "Wedding Cake — Buttercream or Sugar Art" and grouped with the other two wedding-cake options

### Spacing system (uniform vertical rhythm)
- Homepage section padding unified via CSS variables `--sec-pad-y` (2.5rem desktop / 2rem mobile) and `--sec-pad-x` (3.5rem / 1.2rem). All `#` sections use `padding: var(--sec-pad-y) var(--sec-pad-x)`.
- Fixed the big mobile gap under Kanya's portrait (removed stale `height:300px` on `.about-condensed-photo`) + removed redundant margin under the about quote.
- Tightened the homepage offerings gap (`.offerings-intro` margin-bottom 2rem → 0.8rem).
- **Heading sections unified** across all pages: `.portfolio-hero` (about + 6 portfolios + gallery) and faq `.page-hero` use 2.5rem top/bottom desktop, 2rem mobile.

### Portfolio heroes — side-by-side on desktop
- `.portfolio-hero` desktop (min-width:901px) is now a centred grid: title (eyebrow + h1 + divider) LEFT, intro RIGHT, content-sized columns centred as a pair (`grid-template-columns: max-content minmax(0,460px); justify-content:center`). Mobile stays centred/stacked. Handles pages with and without an eyebrow.

### FAQ page — full redesign to match site
- Desktop: centred 2-col layout (`.faq-layout` max-width 1000px) with a **sticky left "On this page" jump-nav** (8 section links + scroll-spy active highlight + smooth scroll). Heading block aligned with content (both start ~213px).
- CTA: converted `#faq-cta` (left/right) → standard centred `.portfolio-cta`.
- Footer: was a 2-col condensed odd-one-out → now standard 3-col (added the missing **Find Kanya** column). Mobile reflow matches (`.footer-top > div:first-child { grid-column: 1/-1 }`).
- Mobile FAQ unchanged (single-column accordion).

### About — Afrikaans quote refined
- Shrunk the Afrikaans quote (was up to 2.3rem → now ~1.6rem) and demoted the English translation to a small light sub-line (~1.12rem, matching the bio "wit" quote). Reads as an intimate aside, not a billboard.

### Buttons — unified to brand mocha
- `.btn-submit` (contact Send Enquiry + WhatsApp) and `.nav-cta` (Enquire Now, all pages) switched from `var(--ink)` (near-black) to `var(--mocha)` (brand brown), hover → ink. Now every button site-wide is the same warm mocha (matching `.btn-primary`). WhatsApp on portfolio CTAs remains the outlined `.btn-secondary`.

### Footer Portfolios — relabelled + centred
- Renamed: "...Weddings" → "...Cakes" (Couverture Chocolate Cakes, White Couverture Cakes); "Buttercream & Sugar Art" → "Buttercream or Sugar Art Cakes" and moved up to group with the cake types.
- Removed the standalone "Weddings"/"Real Weddings" footer link (nav "Weddings" tab → gallery.html stays).
- Footer content (brand row + 3 columns + copyright) centred at max-width 1080px with 2rem column gap, desktop only. Applied across index.html, about.html, faq.html, and portfolio-style.css.

### 404 page + old-link redirects
- `404.html` (branded) catches stale links still in Google's index from the OLD `.htm` site and smart-redirects to the closest current page (mirrors nav tabs): kitchen→Weekend Cakes, wedding/cake→My Cakes (#offerings), order/flavour/delivery/booking→FAQ, contact→#contact, about→about, gallery/real-wedding→gallery, else→homepage. GitHub Pages serves 404.html for any unknown path.

### Google Search Console — set up
- **URL-prefix property** for `https://kanyahunt.co.za` verified via HTML meta tag (`google-site-verification` in index.html head). **Sitemap submitted** (Success). Homepage re-indexing requested. Sitelinks will update over days/weeks as Google re-crawls.

### Full SEO / discoverability pass (comprehensive — replaced the earlier basic pass)
- `robots.txt`: AI-crawler allowlist (GPTBot, ChatGPT-User, Google-Extended, PerplexityBot, ClaudeBot, anthropic-ai, Bytespider) + sitemap.
- `sitemap.xml`: 10 URLs with lastmod + changefreq + priority.
- `llms.txt`: refreshed. `site.webmanifest`: created (icons array empty — see pending).
- **Every page** got: a single consolidated JSON-LD `@graph` (WebSite `#website` + LocalBusiness/FoodEstablishment `#organization` + page-specific node), Twitter cards (mirror OG), geo/ICBM tags, robots meta, theme-color (#2C1810), author, dns-prefetch, manifest link.
- Page-specific schema: WebPage + 4 Reviews (home), Person `#kanya-hunt` (about), FAQPage 14 Q&A (faq), CollectionPage+Breadcrumb (6 portfolio/gallery), Service+Offer (weekend). og:type=profile on about. All schema `@id` unified to `#organization` (old `#business` gone). All 10 blocks JSON-validated.

---

## The site as it currently stands

### Pages (10 total)

| Page | Slots | Notes |
|---|---|---|
| `index.html` | 10 | hero + 3 wedding cards + 2 special-occ cards + 4 Instagram + condensed-about portrait |
| `about.html` | 4 + mother arched portrait | Afrikaans quote band, 2×2 float grid, mother portrait + intro side-by-side |
| `chocolate-weddings.html` | 14 | §1.1 Couverture Chocolate portfolio |
| `white-chocolate-weddings.html` | 15 | §1.2 White Couverture portfolio |
| `celebration-cakes.html` | 11 | §2.1 Celebration Cakes |
| `croquembouche-minis.html` | 9 | §2.2 Petite Creations |
| `buttercream-sugar-art.html` | 12 | §2.3 Buttercream & Sugar Art |
| `weekend-cakes.html` | 18 | Weekend Cakes |
| `gallery.html` | 15 | Real Weddings (nav label "Weddings") |
| `thankyou.html` | — | Post-form thank-you, noindex |
| `faq.html` | — | FAQ with 14 Q&As and FAQPage schema |

### Homepage flow (top → bottom)

1. **Hero** — single full-bleed Ken Burns image (PB 32 sculptural chocolate cake). Eyebrow "BESPOKE COUVERTURE CAKE ARTIST · CAPE TOWN". Single CTA: `Commission a Cake`.
2. **Condensed about (#about)** — 2-column. Left: 3-paragraph bio + chocolate pull quote + MORE ABOUT KANYA →. Right: landscape Kanya portrait.
3. **What I Create (#offerings)**
   - §01 Wedding Cakes (3 cards full-width): Couverture Chocolate · White Couverture · Buttercream & Sugar Art
   - §02 Special Occasions (2 cards centred, smaller): Celebration Cakes · Petite Creations
4. **Weekend Strip** — linen noticeboard section.
5. **Sweet Talk (#reviews)** — 4 client review cards in 2×2 grid.
6. **Say Hello (#contact)** — Web3Forms, centred single-column (max-width 620px).
7. **Instagram (#insta)** — 4-image grid.
8. **Footer** — Brand row + Portfolios (Wedding & Commissions + Weekend Cakes sub-groups) + Find Kanya + Contact.

### Navigation (all pages, desktop + mobile)

`MY CAKES · WEDDINGS · ABOUT ME · WEEKEND CAKES · FAQ` + Enquire Now CTA.

---

## Pending / known issues

| Item | Status | Action |
|---|---|---|
| Domain + HTTPS (apex + www) | ✅ DONE & verified | — |
| Google Search Console | ✅ Verified + sitemap submitted | Sitelinks update on Google's schedule (days–weeks). Nothing to do but wait. |
| Favicon image files | ❌ Don't exist | Site uses `hero_01.jpg` as favicon. No `<link>` to favicon-32/16/apple-touch (would 404). `site.webmanifest` icons array empty. Create proper favicon PNGs when convenient. |
| `logo.png` | ❌ Doesn't exist | LocalBusiness schema uses `hero_01.jpg` as image instead. Commission a real wordmark/logo when ready (`canvas-design` skill). |
| Bing Webmaster Tools | Not done | Optional extra reach: bing.com/webmasters → add site → submit sitemap. |
| Web3Forms domain update | Not done | web3forms.com dashboard → change registered domain from `suzaanloots-web.github.io` to `kanyahunt.co.za`. |
| Test contact form end-to-end | Not done on live | Submit a test enquiry via kanyahunt.co.za; confirm it reaches Kanya's inbox (check junk). |
| FAQ pricing | faq.html has 14 Q&As | Review pricing wording with Kanya. |
| Old Xneelo web hosting | Active but unused | Suzaan may call Xneelo to drop web-hosting (keep domain + email). Not urgent. |

---

## Things to NOT touch (standing don'ts)

- ❌ "Bespoke" appears only in the hero eyebrow on `index.html`. Never reintroduce elsewhere.
- ❌ No How It Works section (`#order` CSS gone permanently).
- ❌ No buttercream/fondant photos in §1 wedding cake portfolio pages.
- ❌ No contact-details grid in Say Hello — lives in footer only.
- ❌ No photographic nav logo.
- ❌ No "Hunt House Kitchen" or "Kitchen Cakes" anywhere.
- ❌ No Koekedoor Season 2 Facebook link.
- ❌ Don't normalise §02 Special Occasions card size to §01 — the size difference is the hierarchy.
- ❌ Don't revert buttons to ink/black — all CTAs are brand `--mocha` now (nav `.nav-cta`, `.btn-submit`, `.btn-primary`). WhatsApp on portfolio CTAs stays outlined `.btn-secondary`.
- ❌ Don't pin the footer columns edge-to-edge — they're centred at max-width 1080px with 2rem gap (desktop). Brand row + columns + copyright all share that centring.
- ❌ Don't re-add a standalone "Weddings"/"Real Weddings" link to the footer Portfolios list. (Nav "Weddings" tab stays.)
- ❌ Don't add `<link>` tags for favicon-32/16/apple-touch — those PNGs don't exist yet (would 404).
- ❌ Don't break the per-page JSON-LD `@graph` — one consolidated block per page (WebSite + LocalBusiness `#organization` + page node). All `@id` = `#organization` (never reintroduce `#business`).
- ❌ Don't change the homepage spacing variables (`--sec-pad-y`/`--sec-pad-x`) or the `.portfolio-hero` / faq heading spacing without re-checking the uniform rhythm.

---

## Next logical work items

1. **Favicon + logo** — create proper favicon PNGs (16/32/apple-touch) and a real logo; then add the `<link rel="icon">` tags + populate `site.webmanifest` icons.
2. **Bing Webmaster Tools** — add site + submit sitemap (optional, easy reach).
3. **Web3Forms domain update** — change registered domain to `kanyahunt.co.za` in their dashboard.
4. **Test contact form end-to-end** on the live site.
5. **FAQ review** — pricing wording with Kanya.
6. **WhatsApp broadcast** — Kanya to send to her 1000+ Friday cake clients before sharing with planners.
7. Check Google search result in ~1–2 weeks — old sitelinks should be replaced by the new nav-mirroring ones.

---

## Image optimizer

```powershell
powershell -ExecutionPolicy Bypass -File "scripts\optimize-image.ps1" `
    -Source "D:\Website with Suzaan [folder]\IMG_XXXX.JPG" `
    -Name "cw-XX-descriptive-slug" `
    -Slot "gallery"   # hero / gallery / offering / portrait / frame / instagram
```

Cache-busting: always append `?v=2` (or bump on re-process) when slotting an image in HTML.

---

## Preview server

Port 3458. `preview_start name=kanya-hunt`. Cache-bust: `window.location.href = '/path.html?t=' + Date.now()`.

---

## When to escalate to Opus

- New page builds (FAQ update, Collaborations page)
- Major brand-voice copywriting
- Any strategy/positioning question
- Pre-deploy major refactors
