import 'package:flutter/material.dart';
import 'package:notification_bar/notification_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotificationBar Demo',
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NotificationBar Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                NotificationBar().show(
                  context: context,
                  message: 'Feature is off. Tap to enable.',
                  style: NotificationStyle.warning,
                  position: NotificationPosition.top,
                  onTap: () => print('Tapped warning'),
                );
              },
              child: const Text('Show Top Warning'),
            ),
            ElevatedButton(
              onPressed: () {
                NotificationBar().show(
                  context: context,
                  message: 'Settings saved successfully!',
                  style: NotificationStyle.success,
                  position: NotificationPosition.bottom,
                  onTap: () => print('Tapped success'),
                );
              },
              child: const Text('Show Bottom Success'),
            ),
          ],
        ),
      ),
    );
  }
}
