import 'package:flutter/material.dart';

import 'screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Metrophobic',
              ),
            ),
          ),
          const SizedBox(height: 20),
          DrawerItem(
            title: 'Meals',
            icon: Icons.restaurant_menu_outlined,
            onTap: () {
              Scaffold.of(context).closeDrawer();
            },
          ),
          DrawerItem(
            title: 'Settings',
            icon: Icons.settings,
            onTap: () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
              Scaffold.of(context).closeDrawer();
            },
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            size: 30,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_right_rounded,
            size: 35,
          ),
          onTap: onTap,
        ),
        const Divider(height: 16, thickness: 1),
      ],
    );
  }
}
