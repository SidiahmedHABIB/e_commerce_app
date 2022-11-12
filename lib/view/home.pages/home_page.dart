import 'package:e_commerce_app/view/cart.page/cart_page.dart';
import 'package:e_commerce_app/view/home.pages/main_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    const MainHomePage(),
    Container(child: Center(child: Text("Next page"))),
    CartPage(),
    Container(child: Center(child: Text("Next next next page"))),
  ];

  void onTopNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mailnColor,
          unselectedItemColor: Colors.black45,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: onTopNav,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
