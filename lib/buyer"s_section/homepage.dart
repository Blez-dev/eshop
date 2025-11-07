import 'package:eshop/buyer%22s_section/views/home_screen.dart';
import 'package:eshop/buyer%22s_section/views/profile_page.dart';
import 'package:eshop/buyer%22s_section/views/saved_ad_page.dart';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentPage = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    SavedAdPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: const Color(0xffDB3022),
        unselectedItemColor: const Color(0xffDADADA),
        unselectedLabelStyle: const TextStyle(letterSpacing: 0),
        selectedLabelStyle: const TextStyle(
          color: Color(0xffDB3022),
          letterSpacing: 1.5,
        ),
        backgroundColor: const Color(0xfff9f9f9),

        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },

        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Saved",
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
