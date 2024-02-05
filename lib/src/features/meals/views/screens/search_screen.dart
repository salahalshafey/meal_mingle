import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';

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
          SearchIcon(mealName: _controller.text, setMealName: _setMealName),
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

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
    required this.mealName,
    required this.setMealName,
  });

  final String mealName;
  final void Function(String mealName) setMealName;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setMealName(mealName),
      icon: const Icon(Icons.search),
      tooltip: Strings.of(context).search,
    );
  }
}
