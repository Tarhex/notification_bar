# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2025-09-28
### Added
- Initial release of **NotificationBar** package.
- Global, animated notification bar with slide-in/out animation.
- Configurable **position** (`top` or `bottom`).
- Multiple **styles**: `info`, `warning`, `success`.
- **Queue system**: notifications are displayed one at a time.
- Tap-to-navigate **action callbacks**.
- Public API via `NotificationBar().show()` and `NotificationBar().dismiss()`.

---

## [Unreleased]
### Planned
- Auto-dismiss with configurable timeout.
- Support for custom themes (colors, icons, typography).
- Priority system for urgent notifications.
- Optional sound/vibration feedback.
