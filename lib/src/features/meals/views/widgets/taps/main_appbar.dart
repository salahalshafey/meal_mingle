import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar(this.jumpToSearchScreen, {Key? key}) : super(key: key);

  final void Function() jumpToSearchScreen;

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 1000;

    return SliverAppBar(
      expandedHeight: 135,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(start: 50, bottom: 50),
        title: RichText(
          overflow: TextOverflow.clip,
          softWrap: true,
          text: TextSpan(
            children: [
              TextSpan(
                text: Strings.of(context).hi(""),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const TextSpan(text: '\n'),
              TextSpan(
                text: Strings.of(context).whatDoYouWantToEat.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          textScaler: const TextScaler.linear(0.7),
        ),
      ),
      leading: isWideScreen
          ? null
          : Transform.translate(
              offset: const Offset(0, 0), // Offset(0, 20),
              child: IconButton(
                // color: Colors.black,
                // iconSize: 28,
                // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                icon: const Icon(Icons.menu_rounded),
                tooltip: Strings.of(context).openNavigationMenu,
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
      actions: [
        Transform.translate(
          offset: const Offset(0, 0), // Offset(0, 20),
          child: IconButton(
            onPressed: jumpToSearchScreen,
            tooltip: Strings.of(context).search,
            icon: const Icon(Icons.search),
          ),
        ),
      ],
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
              child: Text(
                Strings.of(context).categories.toUpperCase(),
                style: const TextStyle(
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
              child: Text(
                Strings.of(context).favorites.toUpperCase(),
                style: const TextStyle(
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
