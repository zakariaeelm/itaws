import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maan_food/Screens/Checkout/cart_screen.dart';
import 'package:maan_food/Screens/Orders/order_screen.dart';
import 'package:maan_food/Screens/Profile/profile_screen.dart';
import 'package:maan_food/constant.dart';
import 'package:maan_food/widgets/map.dart';

import 'offer_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );
  int _selectedItemPosition = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeMap(),
    OrderScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  double getSnakeNavigationBarHeight(context){
    if(Platform.isAndroid) {
      return MediaQuery.of(context).size.width * 0.15;
    }else if(Platform.isIOS) {
      return MediaQuery.of(context).size.width * 0.24;
    }
    return 75.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItemPosition),
      bottomNavigationBar: Container(
        height: getSnakeNavigationBarHeight(context),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: _borderRadius
        ),
        child: SnakeNavigationBar.color(
          backgroundColor: kSecondaryColor,
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.rectangle.copyWith(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),padding: const EdgeInsets.only(left: 10.0, right: 10.0)),
          padding: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(borderRadius: _borderRadius),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          snakeViewColor: kMainColor,
          unselectedItemColor: kGreyTextColor,
          currentIndex: _selectedItemPosition,
          onTap: (index) => setState(() => _selectedItemPosition = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.truckPickup), label: 'Order'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded), label: 'Profile')
          ],
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
