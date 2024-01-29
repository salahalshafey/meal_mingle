import 'package:flutter/material.dart';
import 'package:meal_mingle/src/features/home_and_drawer_screens/main_drawer.dart';

import '../food_scanning/views/screens/food_scan_screen.dart';
import '../meals/screens/tabs_screen.dart';
import '../search/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  int _currentScreenInedex = 0;

  final _screenOptions = [
    const TabsScreen(key: PageStorageKey("TabsScreen")),
    const SearchScreen(key: PageStorageKey("SearchScreen")),
    const FoodScanScreen(key: PageStorageKey("FoodScanScreen")),
  ];

  void _animateToScreen(int pageIndex) {
    _controller.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Builder(
            builder: (ctx) {
              final isWideScreen = MediaQuery.of(ctx).size.width > 1000;

              return isWideScreen ? const MainDrawer() : const SizedBox();
            },
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              children: _screenOptions,
              onPageChanged: (pageIndex) {
                setState(() {
                  _currentScreenInedex = pageIndex;
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenInedex,
        onTap: _animateToScreen,
        // selectedItemColor: ,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Meals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: "Scan Food",
          ),
        ],
      ),
    );
  }
}