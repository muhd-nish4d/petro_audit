import 'package:flutter/material.dart';
import 'package:petro_audit/provider/home_provider.dart';
import 'package:petro_audit/provider/login_provider.dart';
import 'package:petro_audit/screens/login/login.dart';
import 'package:petro_audit/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ScreenSplash(),
      ),
    );
  }
}
