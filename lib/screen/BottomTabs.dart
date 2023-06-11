import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoe_store/component/Constants.dart';
import 'package:shoe_store/screen/bottom_tabs/Account.dart';
import 'package:shoe_store/screen/bottom_tabs/Cart.dart';
import 'package:shoe_store/screen/bottom_tabs/Home.dart';
import 'package:shoe_store/screen/bottom_tabs/Offer.dart';
import 'package:shoe_store/screen/bottom_tabs/Search.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: primaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'lib/assets/icon/icons8-home-50.png',
                  width: 30,
                  height: 30,
                  color: primaryColor,
                ),
                icon: Image.asset(
                  'lib/assets/icon/icons8-home-50.png',
                  width: 30,
                  height: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'lib/assets/icon/icons8-search-50.png',
                  width: 30,
                  height: 30,
                  color: primaryColor,
                ),
                icon: Image.asset(
                  'lib/assets/icon/icons8-search-50.png',
                  width: 30,
                  height: 30,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'lib/assets/icon/icons8-shopping-cart-50.png',
                  width: 30,
                  height: 30,
                  color: primaryColor,
                ),
                icon: Image.asset(
                  'lib/assets/icon/icons8-shopping-cart-50.png',
                  width: 30,
                  height: 30,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'lib/assets/icon/icons8-tag-50.png',
                  width: 30,
                  height: 30,
                  color: primaryColor,
                ),
                icon: Image.asset(
                  'lib/assets/icon/icons8-tag-50.png',
                  width: 30,
                  height: 30,
                ),
                label: 'Offer'),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'lib/assets/icon/icons8-person-50.png',
                  width: 30,
                  height: 30,
                  color: primaryColor,
                ),
                icon: Image.asset(
                  'lib/assets/icon/icons8-person-50.png',
                  width: 30,
                  height: 30,
                ),
                label: 'Person'),
          ]),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: Home());
              },
            );

          case 1:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: Search());
              },
            );

          case 2:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: Cart());
              },
            );

          case 3:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: Offer());
              },
            );

          case 4:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: Account());
              },
            );
        }
        return Container();
      },
    );
  }
}
