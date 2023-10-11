import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petro_audit/screens/bottom_navigation.dart';
import 'package:petro_audit/screens/login/login.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

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
      String? uid = await storage.read(key: 'uid');
      storage.read(key: 'userToken').then((value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            if (value != null) {
              log(value);
              Provider.of<HomeProvider>(context, listen: false).getHomeDatas();
              return ScreenMain(
                uid: uid!,
                token: value,
              );
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
        child: Text('Splash'),
      ),
    );
  }
}
