# KBBG 88.1 — Static Site

Simple, fast site for KBBG FM 88.1 hosted on GitHub Pages.

## Pages
- **Home (`index.html`)**
  - Unified modern player (play/pause, volume, “Now Playing”, artwork, EQ).
  - **“Last 5 Songs”** collapsible section (ads excluded). Loads on page open and refreshes periodically.
  - Store badges (Google Play / App Store).

- **Listen (`listen.html`)**
  - **Player-only** page using the same unified style as the homepage player.
  - Volume control, “Now Playing”, and a text list of the **Last 5 Songs** (ads excluded).
  - Store badges displayed beneath the player.

## Streaming
- Primary: `https://s5.radio.co/se50df870e/listen`
- HLS fallback: `https://s5.radio.co/se50df870e/listen.m3u8`

## Now Playing & Recent
- **Status (current + history):** `https://public.radio.co/stations/se50df870e/status`  
  - Used to populate “Now Playing” and **Last 5 Songs** (server history).  
  - Ads filtered by keywords (“ad”, “advert”, “promo”, “sweeper”, “station id”, “psa”).

## Assets
- Social preview: `/kbbg/assets/og-kbbg-1200x630.jpg`
- Default artwork fallback: `/kbbg/KBBGFM88One400x400.png`

## Local Dev
Open `index.html` in a browser, or use a tiny static server:

```bash
# Python 3
python -m http.server 8080
# then open http://localhost:8080
