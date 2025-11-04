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
  List<Widget> pages = [
    HomeScreen(),
    SavedAdPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: Color(0xffDB3022),
        unselectedItemColor: Color(0xffDADADA),
        unselectedLabelStyle: TextStyle(letterSpacing: 0),
        selectedLabelStyle: TextStyle(
          color: Color(0xffDB3022),
          letterSpacing: 1.5,
        ),
        backgroundColor: Color(0xfff9f9f9),
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },

        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
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
