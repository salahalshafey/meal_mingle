import 'package:flutter/material.dart';

import '../../../../app.dart';

import '../../../home_and_drawer_screens/main_drawer.dart';

import '../widgets/search/meal_search_result.dart';
import '../widgets/search/search_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? _mealName;
  final _controller = TextEditingController();

  void _setMealName(String mealName) {
    if (mealName.trim().isEmpty) {
      return;
    }

    if (mealName.trim().toLowerCase() == _mealName?.trim().toLowerCase()) {
      return;
    }

    setState(() {
      _mealName = mealName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen =
        MediaQuery.of(navigatorKey.currentContext!).size.width > 1000;

    return Scaffold(
      appBar: AppBar(
        title: SearchField(
          controller: _controller,
          setMealName: _setMealName,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              _setMealName(_controller.text);
            },
            icon: const Icon(Icons.search),
            tooltip: "Search",
          ),
        ],
      ),
      drawer: isWideScreen ? null : const MainDrawer(),
      body: _mealName == null
          ? Center(
              child: Image.asset("assets/images/search_meals.png"),
            )
          : MealSearchResult(_mealName!),
    );
  }
}
