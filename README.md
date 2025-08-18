# KBBG FM 88.1 — Static Site

Simple, fast site for KBBG FM 88.1 hosted on GitHub Pages.

## Pages
- **Home (`index.html`)**
  - Unified modern player (play/pause, Now Playing, artwork).
  - **“Last 5 Songs”** list (ads excluded via keyword filter).
  - Store badges (Google Play / App Store).

- **Listen (`listen.html`)**
  - **Player-only** page using the same unified style.
  - **Volume control** matches Home (mute + gold slider, shared `localStorage` key `kbbg-vol`).
  - Store badges under the player.

- **KBB Hub (`kbbhub.html`)**
  - Player above a socials strip.
  - **KBBG History Timeline** (key milestones with sources).
  - **9 feature cards** linking to KBBG-related resources:
    - UNI Oral History, UNI Video, UNI ScholarWorks PDF
    - KBBG Official YouTube
    - Local news stories (KCRG, KWWL)
    - ACR/Spark News 40-year piece
    - Placeholder “History Timeline (Coming Soon)” you can replace anytime.

- **Sitemap**
  - Human: `sitemap.html`
  - XML for crawlers: `sitemap.xml`

## Streaming
- Primary: `https://s5.radio.co/se50df870e/listen`
- HLS fallback: `https://s5.radio.co/se50df870e/listen.m3u8`

## Now Playing & Recent
- Status (used on Hub/Listen): `https://public.radio.co/stations/se50df870e/status`
- Notes: “Last 5 Songs” excludes ad/sweeper content by keywords such as `ad`, `advert`, `promo`, `sweeper`, `station id`, `psa`.

## Assets
- Social preview image: `/kbbg/assets/og-kbbg-1200x630.jpg`
- Default artwork fallback: `/kbbg/KBBGFM88One400x400.png`

## Development
Open `index.html` in a browser, or run a tiny static server:

```bash
# Python 3
python -m http.server 8080
# then open http://localhost:8080
