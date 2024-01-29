import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 1000;

    return SliverAppBar(
      expandedHeight: 135,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 50, bottom: 50),
        title: RichText(
          overflow: TextOverflow.clip,
          softWrap: true,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Hi Mohamed 👋 ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const TextSpan(text: '\n'),
              TextSpan(
                text: 'WHAT DO YOU WANT TO EAT ?',
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          textScaler: const TextScaler.linear(0.7),
        ),
      ),
      leading: isWideScreen
          ? null
          : IconButton(
              //color: Colors.black,
              iconSize: 28,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
              icon: const Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      floating: true,
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 2,
      bottom: TabBar(
        unselectedLabelColor: const Color.fromARGB(255, 44, 54, 63),
        tabs: [
          Tab(
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[300],
              ),
              child: const Text(
                'CATEGORIES',
                style: TextStyle(
                  fontFamily: 'Metrophobic',
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[300],
              ),
              child: const Text(
                'FAVORITES',
                style: TextStyle(
                  fontFamily: 'Metrophobic',
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
