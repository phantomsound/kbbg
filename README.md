# KBBG 88.1 — Static Site

Simple, fast site for KBBG FM 88.1 hosted on GitHub Pages.

## Pages
- **Home (`index.html`)**
  - Unified modern player (play/pause, “Now Playing”, artwork).
  - **“Last 5 Songs”** collapsible section (ads excluded). Loads on page open and refreshes periodically.
  - Store badges (Google Play / App Store).

- **Listen (`listen.html`)**
  - **Player-only** page using the same unified style as the homepage player.
  - Store badges displayed beneath the player.

## Streaming
- Primary: `https://s5.radio.co/se50df870e/listen`
- HLS fallback: `https://s5.radio.co/se50df870e/listen.m3u8`

## Now Playing & Recent
- Current track: `https://public.radio.co/api/v2/se50df870e/track/current`
- Recent history (for last 5 songs): `https://public.radio.co/api/v2/se50df870e/history`  
  - Ads are filtered out (by keywords like “ad”, “advert”, “promo”, “sweeper”, “station id”, “psa”).

## Assets
- Social preview: `/kbbg/assets/og-kbbg-1200x630.jpg`
- Default artwork fallback: `/kbbg/assets/KBBGFM88One%20400x400.png`  
  (Note the encoded space `%20` in the filename.)

## Local Dev
Open `index.html` in a browser, or use a tiny static server:

```bash
# Python 3
python -m http.server 8080
# then open http://localhost:8080
