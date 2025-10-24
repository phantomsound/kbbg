# KBBG FM 88.1 — Static Site

Simple, fast site for KBBG FM 88.1 hosted on GitHub Pages.

## Pages
- **Home (`index.html`)**
  - Unified modern player (play/pause, Now Playing, artwork).
  - **“Last 5 Songs”** list (ads/sweepers filtered by keywords).
  - Store badges.

- **Listen (`listen.html`)**
  - **Player-only** page with the same modern style.
  - Volume UI (mute + gold slider) shares `localStorage` key `kbbg-vol`.
  - Footer matches Home (© line + Sitemap + badges).

- **KBBG Hub (`kbbhub.html`)**
  - Heading: **KBBG Hub**.
  - Player above a socials strip (Hub-only) linking to:
    - Instagram: `https://www.instagram.com/kbbgfm`
    - Facebook: `https://www.facebook.com/KBBGFM88.1/`
    - X/Twitter: `https://x.com/kbbg88`
  - **Right sidebar timeline** that stays visible while scrolling.
  - 9 feature cards to KBBG/Waterloo resources.

- **Sitemap**
  - Human: `sitemap.html`
  - XML for crawlers: `sitemap.xml`

## Streaming
- Primary: `https://s5.radio.co/se50df870e/listen`
- HLS fallback: `https://s5.radio.co/se50df870e/listen.m3u8`

## Now Playing & Recent
- Status (used for Now Playing): `https://public.radio.co/stations/se50df870e/status`
- Home’s “Last 5 Songs”: built from `history` in status JSON; ads removed via keyword filter.

## Assets
- Social preview: `/kbbg/assets/og-kbbg-1200x630.jpg`
- Default artwork fallback: `/kbbg/KBBGFM88One400x400.png`

## Local Dev
```bash
python -m http.server 8080
# open http://localhost:8080
