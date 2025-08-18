
---

## `CHANGELOG.md`
```markdown
# Changelog

## 2025-08-17 (late)
- Switch “Now Playing” and “Last 5 Songs” to **Radio.co status endpoint**:
  `https://public.radio.co/stations/se50df870e/status` (uses server history, not user playback).
- Harden ad filtering (handles “ad break”, “station id”, etc.).
- Standardize fallback artwork path on pages to `/kbbg/KBBGFM88One400x400.png`.
- Add EQ animation CSS and wire it to play/pause state.

## 2025-08-17
- Unified modern player style across Home and Listen.
- Collapsible **Last 5 Songs** on Home (ads excluded).
- Listen page player-only, matching Home styling.
- README and styles updates for unified design.

## 2025-08-16
- Fixed stray/awkward link on Home and improved hero/OG tags.

## 2025-08-15
- Embedded live player on Home; added Featured card.

## 2025-08-09
- Added Open Graph image, cleaned hero copy, added store badges.
- Embedded player on homepage, added “Listen Live” page.

## 2025-08-07
- Initial structure (`index.html`, `listen.html`, `styles.css`), GitHub Pages setup.
