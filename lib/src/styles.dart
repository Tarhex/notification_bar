import 'package:flutter/material.dart';

enum NotificationStyle { info, warning, success }

enum NotificationPosition { top, bottom }

class NotificationTheme {
  final Color backgroundColor;
  final IconData icon;

  const NotificationTheme({
    required this.backgroundColor,
    required this.icon,
  });
}

const Map<NotificationStyle, NotificationTheme> styleThemes = {
  NotificationStyle.info: NotificationTheme(
    backgroundColor: Colors.blueAccent,
    icon: Icons.info_outline,
  ),
  NotificationStyle.warning: NotificationTheme(
    backgroundColor: Colors.orangeAccent,
    icon: Icons.warning_amber_rounded,
  ),
  NotificationStyle.success: NotificationTheme(
    backgroundColor: Colors.green,
    icon: Icons.check_circle_outline,
  ),
};
