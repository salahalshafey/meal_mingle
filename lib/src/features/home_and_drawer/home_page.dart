import 'package:flutter/material.dart';

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
    const TabsScreen(),
    const SearchScreen(),
    const FoodScanScreen(),
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
      body: PageView(
        controller: _controller,
        children: _screenOptions,
        onPageChanged: (pageIndex) {
          setState(() {
            _currentScreenInedex = pageIndex;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenInedex,
        onTap: _animateToScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dining_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: "",
          ),
        ],
      ),
    );
  }
}
