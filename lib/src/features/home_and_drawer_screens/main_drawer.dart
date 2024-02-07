import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Metrophobic',
              ),
            ),
          ),
          const SizedBox(height: 20),
          DrawerItem(
            title: Strings.of(context).home,
            icon: Icons.home_filled,
            onTap: () {
              Scaffold.of(context).closeDrawer();
            },
          ),
          DrawerItem(
            title: Strings.of(context).profile,
            icon: Icons.account_box,
            onTap: () {
              //  goToScreenWithSlideTransition(context ,  SettingsScreen());
              Scaffold.of(context).closeDrawer();
            },
          ),
          DrawerItem(
            title: Strings.of(context).mealsSettings,
            icon: Icons.settings_suggest,
            onTap: () {
              //  goToScreenWithSlideTransition(context ,  SettingsScreen());

              Navigator.of(context).pushNamed(MealsSettingsScreen.routeName);
              Scaffold.of(context).closeDrawer();
            },
          ),
          DrawerItem(
            title: Strings.of(context).generalSettings,
            icon: Icons.settings,
            onTap: () {
              Navigator.of(context).pushNamed(GeneralSettingsScreen.routeName);

              Scaffold.of(context).closeDrawer();
            },
          ),
          DrawerItem(
            title: Strings.of(context).shareTheApp,
            icon: Icons.share,
            onTap: () {
              //  Scaffold.of(context).closeDrawer();

              Share.share(
                Strings.of(context).shareTheAppText,
              );
            },
          ),
          DrawerItem(
            title: Strings.of(context).privacyPolicy,
            icon: Icons.privacy_tip,
            onTap: () {
              //  goToScreenWithSlideTransition(context ,  SettingsScreen());
              launchUrl(
                Uri.parse(
                    "https://sites.google.com/view/aimealmingle-privacypolicy"),
                mode: LaunchMode.externalApplication,
              );
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
            size: 25,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_right_rounded,
            size: 25,
          ),
          onTap: onTap,
        ),
        const Divider(height: 16, thickness: 1),
      ],
    );
  }
}
