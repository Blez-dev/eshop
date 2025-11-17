import 'package:eshop/buyer%22s_section/state_manager/navigation_state_notifier.dart';
import 'package:eshop/buyer%22s_section/state_manager/profile_state_notifier.dart';
import 'package:eshop/buyer%22s_section/views/home_screen.dart';
import 'package:eshop/buyer%22s_section/views/profile_page.dart';
import 'package:eshop/buyer%22s_section/views/saved_ad_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {


  // Remove const to avoid reuse issues
  final List<Widget> pages = [HomeScreen(), SavedAdPage(), ProfilePage()];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileStateProvider.notifier).fetchUserInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageNumState = ref.watch(currentPageProvider);
    return Scaffold(
      body: IndexedStack(index: pageNumState.currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageNumState.currentPage,
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
            ref.read(currentPageProvider.notifier).setIndex(value);
          });
        },
        items: const [
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
