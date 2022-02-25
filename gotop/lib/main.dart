import 'package:flutter/material.dart';
import 'package:gotop/pages/Home/edit_profile_page.dart';
import 'package:gotop/pages/Home/home_page.dart';
import 'package:gotop/pages/Home/main_page.dart';
import 'package:gotop/pages/cart_page.dart';
import 'package:gotop/pages/checkout_page.dart';
import 'package:gotop/pages/checkout_success_page.dart';
import 'package:gotop/pages/detail_chat.dart';
import 'package:gotop/pages/product_page.dart';
import 'package:gotop/pages/sign_in_page.dart';
import 'package:gotop/pages/sign_up_page.dart';
import 'package:gotop/pages/splash_page.dart';
import 'package:gotop/providers/auth_provider.dart';
import 'package:gotop/providers/cart_provider.dart';
import 'package:gotop/providers/product_provider.dart';
import 'package:gotop/providers/transaction_provider.dart';
import 'package:gotop/providers/wishlist_provider.dart';
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
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        )
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
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
