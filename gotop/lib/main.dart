import 'package:flutter/material.dart';
import 'package:gotop/pages/Home/edit_profile_page.dart';
import 'package:gotop/pages/Home/home_page.dart';
import 'package:gotop/pages/Home/main_page.dart';
import 'package:gotop/pages/cart_page.dart';
import 'package:gotop/pages/checkout_page.dart';
import 'package:gotop/pages/detail_chat.dart';
import 'package:gotop/pages/product_page.dart';
import 'package:gotop/pages/sign_in_page.dart';
import 'package:gotop/pages/sign_up_page.dart';
import 'package:gotop/pages/splash_page.dart';
import 'package:gotop/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:gotop/providers/auth_provider.dart';

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
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => editProfilePage(),
          '/product': (context) => ProductPage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage()
        },
      ),
    );
  }
}
