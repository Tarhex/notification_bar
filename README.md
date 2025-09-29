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

To use `notification_bar`, add the following dependency to your `pubspec.yaml`:

``` yaml
dependencies:
  notification_bar: ^1.0.0
```

Run the following command to install the dependency:

```bash
flutter pub get
```

## Usage

Import the package into your Dart file:

```dart
import 'package:notification_bar/notification_bar.dart';
```

```dart
NotificationBar().show(
  context: context,
  message: 'Feature is off. Tap to enable.',
  style: NotificationStyle.warning,
  position: NotificationPosition.top,
  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())),
);
```