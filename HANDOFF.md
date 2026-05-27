# Session Handoff — Kanya Hunt Website
**Last updated:** 2026-05-27 (by Sonnet 4.6)
**Live URL:** https://kanyahunt.co.za ← NEW. Domain migration completed this session.
**Repo:** https://github.com/suzaanloots-web/suzaanloots-web.github.io
**GitHub Pages also responds at:** https://suzaanloots-web.github.io (will redirect to kanyahunt.co.za)

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

### Domain migration — kanyahunt.co.za is LIVE
- `CNAME` file added to repo root containing `kanyahunt.co.za`
- DNS configured on Xneelo: 4 × A records (`@` → GitHub Pages IPs), `www` CNAME → `suzaanloots-web.github.io.`
- GitHub Pages custom domain set to `kanyahunt.co.za`, Enforce HTTPS ✓
- SSL certificate active. All canonical URLs, og:url, JSON-LD @id, sitemap.xml, robots.txt, llms.txt were already pointing to kanyahunt.co.za from previous SEO pass — no further URL changes needed.

**DNS propagation status as of 17:45 on 2026-05-27:**
- `kanyahunt.co.za` A records: fully propagated globally (confirmed via whatsmydns.net, SA confirmed)
- `www.kanyahunt.co.za` CNAME: added ~17:02, propagating (TTL 1200s — should be complete by ~17:30 but ISP caches may take longer)
- Some local devices (Suzaan's phone, router) still caching old Xneelo site — this resolves automatically. No action needed.

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
- Occasion dropdown: removed "Styled shoot / editorial", removed "croquembouche" from Petite Creations

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
| www.kanyahunt.co.za | CNAME added 17:02 — propagating | Wait. Will resolve in <1 hour. |
| Mobile showing "not secure" warning | SSL cert finishing global rollout | Wait <1 hour. Will clear itself. |
| Suzaan/Kanya's local devices still showing old Xneelo site | ISP DNS cache | Reboot router or wait. Clears automatically. |
| Submit sitemap to Google Search Console | Not done yet | After domain fully propagated: Search Console → Add property → kanyahunt.co.za → verify → submit sitemap URL |
| Designer-made logo | Not started | When ready, commission wordmark. `canvas-design` skill for mock-up. |
| FAQ page copy | Exists as faq.html with 14 Q&As | Review with Kanya — pricing is still placeholder range |

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

---

## Next logical work items

1. **Google Search Console** — submit kanyahunt.co.za + sitemap.xml once domain fully stable (do this in ~24 hours)
2. **Test contact form end-to-end** — submit a test enquiry via kanyahunt.co.za, verify arrives in Kanya's inbox (not junk)
3. **Web3Forms domain update** — log into web3forms.com and update the registered domain from `suzaanloots-web.github.io` to `kanyahunt.co.za` so their spam filtering works correctly on the new domain
4. **FAQ review** — read through faq.html with Kanya, update any placeholder pricing
5. **WhatsApp broadcast** — Kanya to send to her 1000+ Friday cake clients before sharing with planners

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
