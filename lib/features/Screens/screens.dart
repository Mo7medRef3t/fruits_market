import 'package:flutter/material.dart';
import 'package:fruits_market/features/Screens/widgets/home/home_view.dart';
import 'package:fruits_market/core/constants.dart';

import 'widgets/favorite_screen.dart';
import 'widgets/my_account_screen.dart';
import 'widgets/shopping_cart_screen.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

int selectedindex = 0;

class _ScreensState extends State<Screens> {
  final List<Widget> _screens = [
    const HomeView(),
    const ShoppingCartScreen(),
     const FavoriteScreen(),
     const MyAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (val) {
            setState(() {
              selectedindex = val;
            });
          },
          currentIndex: selectedindex,
          iconSize: 25,
          selectedItemColor: KMainColor,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Shopping Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_3_outlined), label: "My Account")
          ]),
      body: _screens[selectedindex]
    );
  }
}
