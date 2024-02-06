import 'package:flutter/material.dart';

import '../../../home_and_drawer_screens/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/taps/main_appbar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.jumpToSearchScreen, {Key? key}) : super(key: key);

  final void Function() jumpToSearchScreen;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 1000;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [MainAppBar(widget.jumpToSearchScreen)],
          body: const TabBarView(
            children: [
              CategoriesScreen(key: PageStorageKey("CategoriesScreen")),
              FavoritesScreen(key: PageStorageKey("FavoritesScreen")),
            ],
          ),
        ),
        drawer: isWideScreen ? null : const MainDrawer(),
      ),
    );
  }
}
