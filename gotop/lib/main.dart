import 'package:flutter/material.dart';
import 'package:gotop/pages/Home/home_page.dart';
import 'package:gotop/pages/Home/main_page.dart';
import 'package:gotop/pages/sign_in_page.dart';
import 'package:gotop/pages/sign_up_page.dart';
import 'package:gotop/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage()
      },
    );
  }
}
