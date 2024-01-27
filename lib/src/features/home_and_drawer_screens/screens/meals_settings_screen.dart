import 'package:flutter/material.dart';

import '../../../core/util/widgets/custom_back_button.dart';

import '../widgets/cusom_switch.dart';

class MealsSettingsScreen extends StatefulWidget {
  static const routeName = '/Settings_Screen';

  final Function saveFilters;
  final Map<String, bool> currentFilter;
  const MealsSettingsScreen(this.currentFilter, this.saveFilters, {Key? key})
      : super(key: key);

  @override
  State<MealsSettingsScreen> createState() => _MealsSettingsScreenState();
}

class _MealsSettingsScreenState extends State<MealsSettingsScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    super.initState();

    _glutenFree = widget.currentFilter['gluten']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    _vegan = widget.currentFilter['vegan']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(),
        title: Text(
          'Meals Settings',
          style: Theme.of(context).textTheme.titleSmall,
        ),
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
            currentValue: _glutenFree,
            onChanged: (newValue) {
              setState(() {
                _glutenFree = newValue;
                final filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(filters);
              });
            },
          ),
          CusomSwitch(
            title: 'Lactose-Free',
            subtitle: 'Display Lactose-Free Meals',
            currentValue: _lactoseFree,
            onChanged: (newValue) {
              setState(() {
                _lactoseFree = newValue;
                final filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(filters);
              });
            },
          ),
          CusomSwitch(
            title: 'Vegetarian',
            subtitle: 'Display Vegetarian Meals',
            currentValue: _vegetarian,
            onChanged: (newValue) {
              setState(() {
                _vegetarian = newValue;
                final filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(filters);
              });
            },
          ),
          CusomSwitch(
            title: 'Vegan',
            subtitle: 'Display Vegan Meals',
            currentValue: _vegan,
            onChanged: (newValue) {
              setState(() {
                _vegan = newValue;
                final filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(filters);
              });
            },
          ),
        ],
      ),
    );
  }
}
