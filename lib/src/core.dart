library notification_bar;

import 'package:flutter/material.dart';

import 'notification_bar_widget.dart';
import 'queue.dart';
import 'styles.dart';

class NotificationBar {
  static final NotificationBar _instance = NotificationBar._internal();
  factory NotificationBar() => _instance;
  NotificationBar._internal();

  final List<NotificationRequest> _queue = [];
  OverlayEntry? _overlayEntry;
  NotificationBarWidgetState? _currentState;
  bool _isShowing = false;

  void show({
    required BuildContext context,
    required String message,
    required VoidCallback onTap,
    NotificationStyle style = NotificationStyle.warning,
    NotificationPosition position = NotificationPosition.top,
    Duration animationDuration = const Duration(milliseconds: 500),
  }) {
    _queue.add(NotificationRequest(
      context: context,
      message: message,
      onTap: onTap,
      style: style,
      position: position, // pass along
      animationDuration: animationDuration,
    ));

    if (!_isShowing) {
      _displayNext();
    }
  }

  void _displayNext() {
    if (_queue.isEmpty) {
      _isShowing = false;
      return;
    }

    _isShowing = true;
    final request = _queue.removeAt(0);
    final theme = styleThemes[request.style]!;

    _overlayEntry = OverlayEntry(
      builder: (_) => NotificationBarWidget(
        message: request.message,
        onTap: request.onTap,
        theme: theme,
        animationDuration: request.animationDuration,
        onInit: (state) => _currentState = state,
        position: request.position,
      ),
    );

    Overlay.of(request.context).insert(_overlayEntry!);
  }

  void dismiss() {
    _currentState?.dismissWithAnimation();
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _currentState = null;
    _isShowing = false;
    _displayNext();
  }
}
