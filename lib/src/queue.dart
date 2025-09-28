import 'package:flutter/material.dart';

import 'styles.dart';

class NotificationRequest {
  final BuildContext context;
  final String message;
  final VoidCallback onTap;
  final NotificationStyle style;
  final NotificationPosition position; // NEW
  final Duration animationDuration;

  NotificationRequest({
    required this.context,
    required this.message,
    required this.onTap,
    required this.style,
    required this.position,
    required this.animationDuration,
  });
}
