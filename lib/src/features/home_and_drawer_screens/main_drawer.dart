import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/util/builders/go_to_screen_with_slide_transition.dart';
import 'screens/genearal_settings_screen.dart';
import 'screens/meals_settings_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
                bottomRight: Radius.circular(20),
              ),
            ),
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
            title: 'Home',
            icon: Icons.home_filled,
            onTap: () {
              Scaffold.of(context).closeDrawer();
            },
          ),
          DrawerItem(
            title: 'Profile',
            icon: Icons.account_box,
            onTap: () {
              //  goToScreenWithSlideTransition(context ,  SettingsScreen());
              Scaffold.of(context).closeDrawer();
            },
          ),
          DrawerItem(
            title: 'Meals Settings',
            icon: Icons.settings_suggest,
            onTap: () {
              //  goToScreenWithSlideTransition(context ,  SettingsScreen());

              Navigator.of(context).pushNamed(MealsSettingsScreen.routeName);
              Scaffold.of(context).closeDrawer();
            },
          ),
          DrawerItem(
            title: 'General Settings',
            icon: Icons.settings,
            onTap: () {
              goToScreenWithSlideTransition(
                context,
                const GeneralSettingsScreen(),
              );

              Scaffold.of(context).closeDrawer();
            },
          ),
          DrawerItem(
            title: 'Share',
            icon: Icons.share,
            onTap: () {
              //  Scaffold.of(context).closeDrawer();

              Share.share(
                "           AI MealMingle App\nDownload from the Play Store\n\n"
                "https://play.google.com/store/apps/details?id=com.salahalshafey.aimealmingle",
              );
            },
          ),
          DrawerItem(
            title: 'About',
            icon: Icons.info,
            onTap: () {
              //  goToScreenWithSlideTransition(context ,  SettingsScreen());
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
