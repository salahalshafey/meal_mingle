import 'package:flutter/material.dart';

import '../home_and_drawer_screens/main_drawer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search For Meals"),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: const Placeholder(),
    );
  }
}
