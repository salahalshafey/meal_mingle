import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/util/widgets/custom_back_button.dart';

import '../providers/meals_settings_provider.dart';

import '../widgets/cusom_switch.dart';
import '../widgets/reset_button.dart';

class MealsSettingsScreen extends StatelessWidget {
  static const routeName = '/Settings_Screen';

  final void Function() saveFilters;

  const MealsSettingsScreen(this.saveFilters, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MealsSettings>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(),
        title: Text(
          'Meals Settings',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          ResetButton(
            reset: Provider.of<MealsSettings>(context, listen: false)
                .resetMealsSettings,
          ),
        ],
      ),
      body: ListView(
        children: [
          const Align(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Adjust your Meals Selection',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          CusomSwitch(
            title: 'Gluten-Free',
            subtitle: 'Display Gluten-Free Meals',
            currentValue: provider.isGlutenFree,
            onChanged: (newValue) {
              provider.isGlutenFree = newValue;

              saveFilters();
            },
          ),
          CusomSwitch(
            title: 'Lactose-Free',
            subtitle: 'Display Lactose-Free Meals',
            currentValue: provider.isLactoseFree,
            onChanged: (newValue) {
              provider.isLactoseFree = newValue;

              saveFilters();
            },
          ),
          CusomSwitch(
            title: 'Vegetarian',
            subtitle: 'Display Vegetarian Meals',
            currentValue: provider.isVegetarian,
            onChanged: (newValue) {
              provider.isVegetarian = newValue;

              saveFilters();
            },
          ),
          CusomSwitch(
            title: 'Vegan',
            subtitle: 'Display Vegan Meals',
            currentValue: provider.isVegan,
            onChanged: (newValue) {
              provider.isVegan = newValue;

              saveFilters();
            },
          ),
        ],
      ),
    );
  }
}
