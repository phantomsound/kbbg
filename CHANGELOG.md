# Changelog

## 2025-08-17
- Unified **modern player style** across `index.html` and `listen.html` (purple→black gradient, gold accents).
- Replaced native audio controls with a **custom player UI** (consistent modern styling, gold buttons, “Now Playing” layout).
- Added mini-EQ animation (Web Audio API with graceful fallback).
- **Home**
  - Removed “community/latest” grid.
  - Retained Featured card.
  - Added collapsible **“Last 5 Songs”** (ads excluded, loads immediately and auto-refreshes).
  - “Open” button jumps to full player page.
- **Listen**
  - Updated header to match Home (logo + nav).
  - Player-only layout (no recent tracks), styled same as Home.
- **Assets**
  - Updated image paths to repo-aware form and encoded filename space:
    `/kbbg/assets/KBBGFM88One%20400x400.png`.
- **Styles**
  - Polish CSS (native `<details>` accordion styling, improved spacing/contrast).
- **Docs**
  - Updated README to reflect removals and unified player design.

## 2025-08-16
- Fixed stray/awkward link on Home and improved hero/OG tags.

## 2025-08-15
- Embedded live player on Home; added Featured card.

## 2025-08-09
- Added Open Graph image, cleaned hero copy, added store badges.
- Embedded player on homepage, added “Listen Live” page.

## 2025-08-07
- Initial structure (`index.html`, `listen.html`, `styles.css`), GitHub Pages setup.

## 2025-08-10
- Initial GitHub Pages scaffold; base theme (purple, gold, black).
