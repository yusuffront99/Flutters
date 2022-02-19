import 'package:flutter/material.dart';
import 'package:joumble/pages/home/home_page.dart';
import 'package:joumble/pages/sign_in_page.dart';
import 'package:joumble/pages/sign_up_page.dart';
import 'package:joumble/pages/splash_page.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          // '/detail-chat': (context) => DetailChatPage(),
          // '/edit-profile': (context) => editProfilePage(),
          // '/product': (context) => ProductPage(),
          // '/cart': (context) => CartPage(),
          // '/checkout': (context) => CheckoutPage(),
          // '/checkout-success': (context) => CheckoutSuccessPage()
        },
      ),
    );
  }
}
