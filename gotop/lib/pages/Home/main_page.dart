import 'package:flutter/material.dart';
import 'package:gotop/pages/Home/chat_page.dart';
import 'package:gotop/pages/Home/home_page.dart';
import 'package:gotop/pages/Home/profile_page.dart';
import 'package:gotop/pages/Home/wishlist_page.dart';
import 'package:gotop/providers/page_provider.dart';
import 'package:gotop/themes/themes.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    //===
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    //=== CART
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/images/icon_cart.png',
          width: 20,
        ),
      );
    }

    //=== NAVBAR MENU
    Widget customBottonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 13,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              print(value);
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'assets/images/icon_home.png',
                    width: 21,
                    color: pageProvider.currentIndex == 0
                        ? primaryColor
                        : inActiveButton,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 10, right: 40),
                  child: Image.asset(
                    'assets/images/icon_chat.png',
                    width: 20,
                    color: pageProvider.currentIndex == 1
                        ? primaryColor
                        : inActiveButton,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 10, left: 40),
                  child: Image.asset(
                    'assets/images/icon_favorite.png',
                    width: 20,
                    color: pageProvider.currentIndex == 2
                        ? primaryColor
                        : inActiveButton,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'assets/images/icon_profile.png',
                    width: 21,
                    color: pageProvider.currentIndex == 3
                        ? primaryColor
                        : inActiveButton,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    //===>>> SHOW PAGE
    Widget content() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
          break;

        case 1:
          return ChatPage();
          break;

        case 2:
          return WishListPage();
          break;

        case 3:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottonNav(),
      body: content(),
    );
  }
}
