import 'package:flutter/material.dart';
import 'package:shamo/pages/sign_page.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignPage(),
      },
    );
  }
}
