# Session Handoff — Kanya Hunt Website
**Last updated:** 2026-05-26 (by Opus 4.7 — handing to Sonnet 4.6)
**Live URL:** https://suzaanloots-web.github.io
**Repo:** https://github.com/suzaanloots-web/suzaanloots-web.github.io

---

## Read this first

**Suzaan Loots** runs the project (Kanya's partner). Non-technical — plain English always, no code dumps. Prefers natural conversation. Use `AskUserQuestion` sparingly.

**Push-on-every-change is authorised.** Push to `origin/main` straight after each sensible chunk of work — no need to ask. Still confirm before destructive operations (rm, force push, branch delete).

**Foundational context:** `CLAUDE.md` in this folder (brand positioning, photo curation criteria, optimizer usage, don'ts list). Also see persistent memory at `C:\Users\suzaa\.claude\projects\G--My-Drive-Kanya-Hunt\memory\` — especially `MEMORY.md` (index), `project_kanya_hunt.md`, `feedback_orphan_id_css.md`, `user_profile_suzaan_kanya_hunt.md`, `feedback_couverture_cake_artist.md`.

---

## Git status

Branch `main` is **fully up to date with `origin/main`**. Working tree is clean apart from two Word artefacts (`IMAGE_INVENTORY.md.docx` + `~$AGE_INVENTORY.md.docx`) — Suzaan opens the inventory Markdown in Word for annotation; never commit those. Add a `.gitignore` entry for `~$*` when convenient.

---

## What's shipped since the last handover (2026-05-22)

Approx. 40+ commits across two sessions (2026-05-25 and 2026-05-26). Highlights, grouped:

### Site architecture
- **Removed `How It Works` section** from homepage entirely (#order). Removed from mobile menu.
- **Restructured the `Say Hello` / Contact section** to a centred single-column form (max-width 620px). Removed: contact-details grid (WhatsApp / Email / Instagram / Location now live only in the footer), the frame image, the R[X] pricing note, the 24-hour-response note. Added a `Tell me your vision` eyebrow + "WhatsApp or complete the form below…" paragraph above the form. CTA row is `Send Enquiry → · or · WhatsApp Kanya` with both as primary dark CTAs and an italic mocha "or" between.
- **Wedding Cakes / Special Occasions hierarchy.** Buttercream & Sugar Art card moved from §02 Special Occasions into §01 Wedding Cakes (Kanya's framing: "these are really wedding cakes too"). §01 is now 3 cards (Couverture / White Couverture / Buttercream & Sugar Art). §02 is now 2 cards (Celebration Cakes / Petite Creations).
- **§02 visual hierarchy.** §02 cards on desktop are constrained to `max-width: 48%; margin: 0 auto` and the internal text is scaled smaller — cards display at ~73% the size of §01 cards so §02 reads as visually secondary. Mobile layout untouched.
- **Weekend Cakes (The Kitchen) restructure.** Moved the "Join the List" CTA section from page bottom to immediately under the hero intro (above the gallery). Added a second primary CTA `View the Koekrun weekly menu` linking to `https://www.instagram.com/kanyahunt/`.
- **Footer Koekedoor link removed** from all 9 pages (`kanyahuntkoekedoor2` Facebook link — no longer maintained).
- **Bespoke reduction.** Stripped the word "bespoke" from the site EXCEPT the single hero eyebrow on index.html (`Bespoke Couverture Cake Artist · Cape Town`) which is the brand title. Replacement rules applied: "made to order" / "handcrafted" / "commissioned" / "made for you" / "fine couverture" / "Special Occasions" depending on context.
- **Nav renames.** `Creations` → `My Cakes` and `About` → `About Me` across all 9 pages (desktop + mobile).
- **Mobile hero eyebrow.** Below the 900px breakpoint, "Bespoke" is hidden and "Cape Town" breaks onto its own line — mobile reads:
  ```
  COUVERTURE CAKE ARTIST
  CAPE TOWN
  ```
  Desktop is unchanged.

### Image work
- **109+ images** across 9 pages. See `IMAGE_INVENTORY.md` for the full reviewed inventory (filename + alt text + caption per slot, sectioned by page).
- **Homepage condensed-about photo** sized to `aspect-ratio: 21/9` so the row height = text content height (no dead space below "MORE ABOUT KANYA"). `object-position: center 75%` so Kanya's mouth stays in the visible crop.
- **Homepage Couverture Chocolate card** now uses `home-cw-card.jpg` — IMG_2386 squared with sampled #ABACAD padding bars so the full multi-tier cake + silver pedestal is visible, matching the White Couverture card framing. `cw-01-hero.jpg` (used on the portfolio page) is intentionally untouched.
- Many slot replacements / additions / removals across cw, ww, cc, cm, bs, wc, rw — see commit log for specifics.
- Logo experiment (peach rose + chocolate drizzle, circular 40px) was added then **fully reverted**. A photographic logo at small size reads as "a small rose photo" not as a brand mark. When Kanya is ready for a proper wordmark / icon mark, the `canvas-design` skill can mock up directions.

### Standing facts (do not undo)
- The single permitted use of "Bespoke" on the site is `index.html:695` hero eyebrow. Don't reintroduce elsewhere.
- The homepage Couverture Chocolate offering card uses `home-cw-card.jpg`, **not** `cw-01-hero.jpg`. Two separate files for two different display contexts.
- Same pattern for White Couverture: homepage uses `home-ww-card.jpg`, portfolio page uses `ww-01-gold-orchid.jpg`.
- Special Occasions cards are deliberately smaller than Wedding Cakes cards on desktop (hierarchy choice). Don't normalise.

---

## The site as it currently stands

### Pages (9 total)

| Page | Slots | Notes |
|---|---|---|
| `index.html` | 10 | hero + 3 wedding cards + 2 special-occ cards + 4 Instagram + condensed-about portrait |
| `about.html` | 4 (+ mother arched portrait) | hero strip → Afrikaans quote band → 2×2 grid + bio + portrait → credentials → "A Different Kind of Cake" |
| `chocolate-weddings.html` | 14 | §1.1 Couverture Chocolate portfolio |
| `white-chocolate-weddings.html` | 15 | §1.2 White Couverture portfolio (added ww-15 croquembouche) |
| `celebration-cakes.html` | 11 | §2.1 Celebration Cakes |
| `croquembouche-minis.html` | 9 | §2.2 Petite Creations |
| `buttercream-sugar-art.html` | 12 | §2.3 Buttercream & Sugar Art |
| `weekend-cakes.html` | 18 | The Kitchen / Weekend Cakes |
| `gallery.html` | 15 | Real Weddings (nav label "Weddings") |

**Site total: ~108 portfolio image slots + nav/contact/footer images.**

### Homepage flow (top → bottom)

1. **Hero** — single full-bleed Ken Burns image (PB 32 sculptural chocolate cake on terracotta). Eyebrow "BESPOKE COUVERTURE CAKE ARTIST · CAPE TOWN" (linen). Title "Where chocolate becomes art" (cream serif, blush italic em). Single CTA: `Commission a Cake`. On mobile, eyebrow becomes `COUVERTURE CAKE ARTIST` / `CAPE TOWN` (Bespoke hidden, Cape Town on new line).
2. **Credentials strip** — full-width 4-column row (Craft · Credentials · Location · Enquiries) on linen.
3. **Condensed about (#about)** — 2-column, max-width 1440px, gap 4rem. Left: bio + chocolate quote + MORE ABOUT KANYA →. Right: landscape Kanya portrait `home-ab-kanya-portrait.jpg` with `aspect-ratio: 21/9; object-position: center 75%`.
4. **What I Create (#offerings)** — two sections:
   - **§01 Wedding Cakes** (3 cards full-width): Couverture Chocolate · White Couverture · Buttercream & Sugar Art
   - **§02 Special Occasions** (2 cards centred at 48% max-width, smaller text): Celebration Cakes · Petite Creations
5. **Weekend Strip** — quiet framed noticeboard (linen section + parchment inner card + hairline gold border + text-link CTAs).
6. **Say Hello (#contact)** — centred single-column (max-width 620px). Headline + "Every commission begins…" + Tell me your vision eyebrow + "WhatsApp or complete the form below…" + form. Bottom CTAs: `Send Enquiry → · or · WhatsApp Kanya` (both dark primary).
7. **Instagram (#insta)** — @kanyahunt handle + 4-image grid.
8. **Footer** — Brand row + Portfolios (Wedding & Commissions sub-group + The Kitchen sub-group) + Find Kanya column + Contact column.

### Navigation (all 9 pages, desktop + mobile)

`MY CAKES · WEDDINGS · ABOUT ME · THE KITCHEN · CONTACT` + Enquire Now CTA.

Active page styling: `.active` class applied on whichever nav link matches the current page (e.g. `About Me` is active on about.html).

### Weekend Cakes / The Kitchen page

Section order is now:
1. Portfolio hero (intro)
2. **Portfolio CTA** (Join the list) — moved up from page bottom. Two primary buttons side by side: `Join the WhatsApp List` (wa.me placeholder) + `View the Koekrun weekly menu` (Instagram).
3. Portfolio gallery (18 images)
4. Craft detail (long write-up)
5. Footer

---

## Pending placeholders (still TBD from Kanya)

| Placeholder | Where | Action when ready |
|---|---|---|
| WhatsApp number `+27 XX XXX XXXX` / `wa.me/27XXXXXXXXX` | All 9 pages (nav CTAs, footer, weekend CTA buttons) | Find/replace `27XXXXXXXXX` globally |
| Pricing anchor `R[X] for up to [Y] guests` | No longer on the homepage (removed when Say Hello was restructured) — earmarked for a future FAQ section | When you build the FAQ, drop this line in with real numbers |
| Real reviews | Reviews section is not on the site yet — re-add once Kanya provides 3-4 real client testimonials | Don't add placeholder reviews per the roadmap |
| Designer-made logo | Currently no logo in nav (typography-only). Kanya tried a photographic logo and removed it. | When ready, commission a proper wordmark/icon mark. Use `canvas-design` skill for mock-up directions if helpful. |

---

## Things to NOT touch (standing dos / don'ts)

- ❌ Don't reintroduce "bespoke" anywhere except the hero eyebrow on index.html (single permitted instance).
- ❌ Don't reintroduce the How It Works section or `#order` CSS — fully gone, intentionally.
- ❌ Don't put buttercream/fondant work into the §1 wedding cake portfolios (chocolate-weddings / white-chocolate-weddings). Despite the §01 grouping on the homepage, the *portfolio pages* stay chocolate-only.
- ❌ Don't add the contact-details grid (WhatsApp/Email/Instagram/Location) back to the Say Hello section. Those lines live in the footer Contact column on every page.
- ❌ Don't add a photographic image as the nav logo. Was tried, doesn't read at 40px.
- ❌ Don't add placeholder reviews. Wait for real testimonials.
- ❌ Don't reintroduce "Hunt House Kitchen" or "Kitchen Cakes" anywhere. The "Kitchen" word survives only as the nav label pointing to weekend-cakes.html.
- ❌ Don't reintroduce the Koekedoor Season 2 Facebook link. No longer maintained.
- ❌ Don't normalise the §02 Special Occasions card size to match §01 on desktop — the size difference is the hierarchy.

---

## How Suzaan works (UX expectations)

- Wants my honest opinion on quality/composition/repetition before image swaps — pattern is: assess → flag concerns → she greenlights/adjusts → I execute.
- Will sometimes typo a filename (e.g. "4818" when she means "4814"). Search the source folder, propose the likely intended file, confirm in the response if there's any doubt.
- She often opens `IMAGE_INVENTORY.md` in Word to annotate — keep the file UTF-8 (no BOM) so the em-dashes render.
- She frequently asks "any questions?" — that's an invitation. Don't skip the clarifying step.

---

## Image optimizer

```powershell
powershell -ExecutionPolicy Bypass -File "scripts\optimize-image.ps1" `
    -Source "D:\Website with Suzaan [folder]\IMG_XXXX.JPG" `
    -Name "cw-XX-descriptive-slug" `
    -Slot "gallery"   # hero / gallery / offering / portrait / frame / instagram
```

Slug naming: `cw-` (chocolate weddings), `ww-` (white chocolate), `cc-` (celebration), `cm-` (petite/croquembouche), `bs-` (buttercream/sugar art), `wc-` (weekend), `rw-` (real weddings gallery), `home-` (homepage assets).

Cache-busting: always append `?v=2` (or bump v=3, v=4 on re-process) when slotting an image in HTML.

### Notable optimiser technique: pre-padding to square

When a tall portrait source needs to fit a square `.offering-img` (1:1) without losing top/bottom of the cake, **pre-pad the source horizontally** with the sampled background colour. See the home-cw-card.jpg recipe: load source, sample top-left corner colour, build a square canvas at source height, fill with sampled colour, paste source centred, optimise. The grey/cream padding blends with the natural background.

---

## Preview server

Configured in `G:\My Drive\Kanya Hunt\.claude\launch.json` (port 3458). The server's docroot is `G:\My Drive\Kanya Hunt` so all paths are served from there. `preview_start name=kanya-hunt`.

After file changes: `window.location.href = '/path.html?t=' + Date.now()` for cache-busted reload.

---

## When to escalate back to Opus

- New page builds (FAQ, Collaborations) — copy and information architecture decisions
- Major brand-voice copywriting (real testimonials integration, FAQ copy, refined price anchor wording)
- Pre-deploy major refactors
- Any strategy/positioning question you're stuck on

---

## Today's notable architectural learnings

1. **Pre-pad tall portraits to square** instead of relying on `object-position` when the entire subject needs to be visible in a 1:1 frame.
2. **Visual hierarchy via container max-width**, not just font size — constraining `.offerings-grid-2` to 48% creates the §01 vs §02 secondary feel cleanly.
3. **Orphan ID-targeted CSS is a hazard**: when restructuring a section but keeping the same `id`, grep `#id` and prune dead rules. Banked previously in `feedback_orphan_id_css.md`.
4. **Photographic logos don't scale to nav-bar sizes.** Tested empirically. Document for future asks.

---

## QA checklist on pickup

```powershell
# 1. Verify no orphan images
$used = @(); foreach ($f in (Get-ChildItem -Filter *.html)) { 
  $c = Get-Content $f.FullName -Raw; 
  $used += ([regex]::Matches($c, 'images/([a-z0-9-]+\.(?:jpg|jpeg|png|mp4))', 'IgnoreCase') | ForEach-Object { $_.Groups[1].Value }) 
}
$onDisk = Get-ChildItem "images" -File | Select-Object -ExpandProperty Name
Compare-Object ($used | Sort-Object -Unique) ($onDisk | Sort-Object) -PassThru

# 2. Verify no broken images on each page (load via preview, check naturalWidth === 0)

# 3. Verify "bespoke" / "Bespoke" appears only once site-wide (index.html:695 hero eyebrow)
Get-ChildItem -Filter *.html | Select-String -Pattern '[Bb]espoke'
```

Good luck. Live URL: https://suzaanloots-web.github.io
