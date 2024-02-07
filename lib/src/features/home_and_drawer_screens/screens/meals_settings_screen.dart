import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meal_mingle/l10n/l10n.dart';

import '../../../core/util/widgets/custom_back_button.dart';

import '../providers/meals_settings_provider.dart';

import '../widgets/cusom_switch.dart';
import '../widgets/reset_button.dart';

class MealsSettingsScreen extends StatelessWidget {
  static const routeName = '/Meals-Settings_Screen';

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
          Strings.of(context).mealsSettings,
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
          Align(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                Strings.of(context).adjustYourMealsSelection,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          CusomSwitch(
            title: Strings.of(context).glutenfree,
            subtitle: Strings.of(context)
                .displayMealTypeMeals(Strings.of(context).glutenfree),
            currentValue: provider.isGlutenFree,
            onChanged: (newValue) {
              provider.isGlutenFree = newValue;

              saveFilters();
            },
          ),
          CusomSwitch(
            title: Strings.of(context).lactosefree,
            subtitle: Strings.of(context)
                .displayMealTypeMeals(Strings.of(context).lactosefree),
            currentValue: provider.isLactoseFree,
            onChanged: (newValue) {
              provider.isLactoseFree = newValue;

              saveFilters();
            },
          ),
          CusomSwitch(
            title: Strings.of(context).vegetarian,
            subtitle: Strings.of(context)
                .displayMealTypeMeals(Strings.of(context).vegetarian),
            currentValue: provider.isVegetarian,
            onChanged: (newValue) {
              provider.isVegetarian = newValue;

              saveFilters();
            },
          ),
          CusomSwitch(
            title: Strings.of(context).vegan,
            subtitle: Strings.of(context)
                .displayMealTypeMeals(Strings.of(context).vegan),
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
