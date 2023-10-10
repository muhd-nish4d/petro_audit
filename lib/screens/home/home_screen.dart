import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.hi});
  final String hi;

  @override
  Widget build(BuildContext context) {
    const storage = FlutterSecureStorage();
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: TextButton(
          onPressed: () async {
            String? value = await storage.read(key: 'uid');
            String? a = await storage.read(key: 'userToken');

            log('$value     -    $a');
          },
          child: Text('hi')),
    );
  }
}
