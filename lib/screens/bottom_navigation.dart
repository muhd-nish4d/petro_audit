import 'package:flutter/material.dart';
import 'package:petro_audit/screens/audit/audit_screen.dart';
import 'package:petro_audit/screens/home/home_screen.dart';
import 'package:petro_audit/screens/profile/profile_screen.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key, required this.uid, required this.token});
  final String uid;
  final String token;

  ValueNotifier<int> screenNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(hi: token),
      const ScreenAudit(),
      const ScreenProfile()
    ];
    return ValueListenableBuilder(
        valueListenable: screenNotifier,
        builder: (context, value, child) {
          return Scaffold(
            body: screens[value],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: value,
                onTap: (value) {
                  screenNotifier.value = value;
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'hi'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.abc), label: 'hello'),
                  BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'hii')
                ]),
          );
        });
  }
}
