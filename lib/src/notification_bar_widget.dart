import 'package:flutter/material.dart';

import 'core.dart';
import 'styles.dart';

class NotificationBarWidget extends StatefulWidget {
  final String message;
  final VoidCallback onTap;
  final NotificationTheme theme;
  final Duration animationDuration;
  final NotificationPosition position;
  final Function(NotificationBarWidgetState) onInit;

  const NotificationBarWidget({
    super.key,
    required this.message,
    required this.onTap,
    required this.theme,
    required this.animationDuration,
    required this.position,
    required this.onInit,
  });

  @override
  NotificationBarWidgetState createState() => NotificationBarWidgetState();
}

class NotificationBarWidgetState extends State<NotificationBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    widget.onInit(this);

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    final isTop = widget.position == NotificationPosition.top;
    _slideAnimation = Tween<Offset>(
      begin: isTop ? const Offset(0, -1) : const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  void dismissWithAnimation() async {
    await _controller.reverse();
    NotificationBar().hide();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    widget.onTap();
    dismissWithAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final isTop = widget.position == NotificationPosition.top;

    return Positioned(
      top: isTop ? MediaQuery.of(context).padding.top : null,
      bottom: !isTop ? MediaQuery.of(context).padding.bottom : null,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: Material(
          color: widget.theme.backgroundColor,
          elevation: 4,
          child: InkWell(
            onTap: _handleTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(widget.theme.icon, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
