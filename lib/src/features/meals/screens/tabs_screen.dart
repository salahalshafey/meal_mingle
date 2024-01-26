import 'package:flutter/material.dart';

import '../../home_and_drawer_screens/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_appbar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              const [MainAppBar()],
          body: const TabBarView(
            children: [CategoriesScreen(), FavoritesScreen()],
          ),
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
