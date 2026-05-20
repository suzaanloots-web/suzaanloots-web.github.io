# Session Handoff — Kanya Hunt Website
**Written:** 2026-05-20 (afternoon, by Sonnet 4.6)
**Reason for handoff:** Suzaan wants Opus to look at the homepage slideshow and suggest a fix.
**Project root:** `G:\My Drive\Kanya Hunt\Github\hunthouse-website\`

---

## Read this first

**Suzaan Loots** runs the project. She is **non-technical** — no code dumps, plain English always. She prefers natural conversation. Use `AskUserQuestion` sparingly.

**Do NOT push to origin/GitHub Pages without Suzaan's explicit go-ahead.** (She approved the push today — but treat each session's push as a fresh decision.)

Full agent context lives in `CLAUDE.md` in this folder — read that for brand positioning, photo curation criteria, the optimizer script usage, and the don'ts list.

---

## Git status — fully clean

All work from this session is committed and pushed. Branch `main` is up to date with `origin/main`. No uncommitted changes.

Recent commits (most recent first):
- `2894723` Add remaining orphaned images to repo
- `de67aa3` Celebration Cakes: swap painted garden and pink ombre ruffles positions
- `3d96fad` Hide hover captions on touchscreens — captions were sticking on tap
- `7f38bfc` Fix mobile gallery aspect ratio — portrait cakes now show in full
- `9f98d64` Homepage: about section team photos + all 6 offering card images
- `752d976` Homepage hero: desktop cake positions + mobile text overlay

---

## What Suzaan wants Opus to look at — THE PRIMARY TASK

### Homepage slideshow — needs a fix / fresh look

**File:** `index.html`
**The slideshow** is the hero section at the top of the homepage. It cycles through 4 slides, each with a full-bleed portrait cake photo on the right and the hero title text on the left.

**Known issues / what Suzaan is unhappy with:**
- The mobile hero was worked on extensively this session and Suzaan eventually said *"I am giving up, this is not working, lets move on"* — so the mobile hero layout is imperfect but committed as-is
- On desktop it works but Suzaan hasn't explicitly signed off on it as final
- Suzaan wants Opus to look at the slideshow fresh and **suggest a possible fix** — this is an open brief, not a specific bug. She may want a redesign of the mobile layout, a simpler approach, or just tweaks

**What to do:**
1. Read `index.html` to understand the current slideshow structure
2. Start the preview server (`kanya-hunt` on port 3458) and look at both desktop and mobile views
3. Come back to Suzaan with a clear suggestion in plain English — what you'd change and why — before touching any code

**Context on the mobile hero (from this session's work):**
The mobile layout stacks: title text overlaid top-left via a radial gradient → cake image below/behind. The challenge is that the hero portrait images (3 slides, all tall portrait) are shifted `translateX(25%)` on slides 2/3/4 to show the cake to the right of the text, but this creates a gap on the left that needs to match the background colour. Slide 1 (`home-01`) fills the full width naturally. The radial gradient overlay (top-left corner, linen colour) fades out to the right to keep the cake visible.

Hero images in `images/`:
- `home-01-ruffle-ganache.jpg` (1200×1800 portrait)
- `home-02-macro-texture.jpg` (portrait)
- `home-03-berry-ganache.jpg` (portrait)
- `home-04-[check HTML]` — check index.html for the 4th slide

---

## What else is pending (lower priority, for after the slideshow)

### Pages still needing photo content
| Page | Slots remaining | Source folder |
|------|----------------|---------------|
| `index.html` contact frames ×2 | 2 slots | Awaiting Suzaan's picks |
| `index.html` Instagram row ×4 | 4 slots | Awaiting Suzaan's picks |

### Global placeholders still to fill
- **WhatsApp number:** Replace `27XXXXXXXXX` and `+27 XX XXX XXXX` across all 8 HTML files when Kanya provides it
- **Price anchor:** Replace `R[X] for up to [Y] guests` in `index.html` contact form

### Croquembouche & Minis — two open concerns (from prior session)
1. `cm-02-choc-cylinders.jpg` is mis-captioned — image actually shows chocolate-dipped strawberries, not cylinders. Caption and alt text need updating (or image needs swapping).
2. `cm-06-hands-cupcake.jpg` is a portrait photo in a `feature-wide` (landscape) slot — it's cropped. Could swap in a natively landscape photo instead.

---

## How the site is structured

8 HTML pages + 1 shared CSS:
- `index.html` — homepage
- `chocolate-weddings.html`, `white-chocolate-weddings.html`, `celebration-cakes.html`, `croquembouche-minis.html`, `buttercream-sugar-art.html`, `weekend-cakes.html` — 6 portfolio sub-pages
- `gallery.html` — Real Weddings
- `portfolio-style.css` — shared CSS for all sub-pages (homepage has its own inline styles)
- `scripts/optimize-image.ps1` — image pipeline
- `images/` — all optimized photos

## Preview server

Already configured. Start with:
```
preview_start name=kanya-hunt
```
Port 3458. After file changes, just reload — no restart needed.

---

## When to escalate / stay in Opus

Stay in Opus for:
- The slideshow suggestion and any redesign work that follows
- Brand-voice copywriting
- Pre-deploy final review

Switch to Sonnet 4.6 for:
- Image swaps, caption fixes, layout tweaks once decisions are made
- Photo curation from source folders
