import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petro_audit/presentation/bottom_navigation.dart';
import 'package:petro_audit/presentation/login/login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      const storage = FlutterSecureStorage();
      storage.read(key: 'userToken').then((value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            if (value != null) {
              return ScreenMain();
            } else {
              return ScreenLogin();
            }
          },
        ));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Petro',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 38, 104),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
