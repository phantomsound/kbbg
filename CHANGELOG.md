# Changelog

All notable changes to this project are documented here.

---

### 2025-08-17
- **Home**
  - Removed “community/latest” items section per request.
  - Kept Featured card; retained unified player with collapsible “Last 5 Songs”.
- **Listen**
  - Updated header to match Home (logo + nav).
  - Applied the same modern player card (gradient, gold buttons, Now Playing layout).
- **Styles**
  - Minor tweaks to ensure Listen page picks up the unified styling.
- **Docs**
  - Updated README to reflect removals and unified player design.

### 2025-08-16
- Fixed stray/awkward link on Home and improved hero/OG tags.

### 2025-08-15
- Embedded live player on Home; added Featured card.

### 2025-08-10
- Initial GitHub Pages scaffold; base theme (purple, gold, black).
# Changelog

### 2025-08-17 (evening)
- Replaced native audio controls with a **custom player UI** on both Home and Listen for consistent modern styling.
- Added mini-EQ visual that animates when playing (Web Audio API with graceful fallback).
- Unified buttons (Play/Pause, Volume). “Open” button on Home jumps to full player page.
- Kept “Now Playing” on both pages and the collapsible **Last 5 Songs** (Home), excluding ads with **AD BREAK** notation.
- Styling refinements for gradient, cards, and controls.

### 2025-08-17
- Home: removed community/latest grid, retained Featured and collapsible Last 5 Songs.
- Listen: matched Home’s modern visual style (gradient, card, now playing).


---

# `CHANGELOG.md`
```markdown
# Changelog

## 2025-08-17
- Unify **modern player style** across `index.html` and `listen.html` (purple→black gradient, gold accents).
- **Remove Featured** block from homepage for simpler layout.
- Add **collapsible “Last 5 Songs”** to homepage (ads excluded, loads immediately and auto-refreshes).
- Make `listen.html` **player-only** (no recent tracks), matching homepage player look.
- Polish CSS (native `<details>` accordion styling, improved spacing/contrast).

## 2025-08-09
- Added Open Graph image, cleaned hero copy, added store badges.
- Embedded player on homepage, added “Listen Live” page.

## 2025-08-07
- Initial structure (index / listen / styles), GitHub Pages setup.

---

# `CHANGELOG.md`
```markdown
# Changelog

## 2025-08-17
- Unify **modern player style** across `index.html` and `listen.html` (purple→black gradient, gold accents).
- **Remove Featured** block from homepage for simpler layout.
- Add **collapsible “Last 5 Songs”** to homepage (ads excluded, loads immediately and auto-refreshes).
- Make `listen.html` **player-only**, matching homepage player look.
- Update image paths to repo-aware form and encode filename space:
  `/kbbg/assets/KBBGFM88One%20400x400.png`.
- Polish CSS (native `<details>` accordion styling, improved spacing/contrast).

## 2025-08-09
- Added Open Graph image, cleaned hero copy, added store badges.
- Embedded player on homepage, added “Listen Live” page.

## 2025-08-07
- Initial structure (index / listen / styles), GitHub Pages setup.
