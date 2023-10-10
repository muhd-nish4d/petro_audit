import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petro_audit/screens/bottom_navigation.dart';
import 'package:petro_audit/screens/login/login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () async {
      const storage = FlutterSecureStorage();
      String? uid = await storage.read(key: 'uid');
      String? token = await storage.read(key: 'userToken');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          if (token != null) {
            return ScreenMain(
              uid: uid!,
              token: token,
            );
          } else {
            return ScreenLogin();
          }
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
