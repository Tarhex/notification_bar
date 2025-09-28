# NotificationBar

A global, animated, queued notification bar for Flutter apps. 

## ✨ Features

- 🔝 **Top or bottom positioning** (configurable per notification)
- 🎨 **Multiple styles**: `info`, `warning`, `success`
- 🔁 **Queued notifications** (one at a time, next shows after dismissal)
- 👆 **Tap-to-navigate actions**
- 🎬 **Smooth slide animations**
- ⚡ **Global access** via singleton (`NotificationBar().show()`)

## 🚀 Installation

Add to your `pubspec.yaml`:

### yaml
dependencies:
  notification_bar: ^1.0.0


## Usage

NotificationBar().show(
  context: context,
  message: 'Feature is off. Tap to enable.',
  style: NotificationStyle.warning,
  position: NotificationPosition.top,
  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())),
);
