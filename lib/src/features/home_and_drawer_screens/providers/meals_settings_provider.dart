import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _mealsSettingsBox = Hive.box("meals_settings");

const _isGlutenFree = "isGlutenFree";
const _isLactoseFree = "isLactoseFree";
const _isVegan = "isVegan";
const _isVegetarian = "isVegetarian";

class MealsSettings extends ChangeNotifier {
  bool get isGlutenFree {
    return _mealsSettingsBox.get(_isGlutenFree) ?? false;
  }

  bool get isLactoseFree {
    return _mealsSettingsBox.get(_isLactoseFree) ?? false;
  }

  bool get isVegetarian {
    return _mealsSettingsBox.get(_isVegetarian) ?? false;
  }

  bool get isVegan {
    return _mealsSettingsBox.get(_isVegan) ?? false;
  }

  set isGlutenFree(bool isGlutenFree) {
    _mealsSettingsBox.put(_isGlutenFree, isGlutenFree);

    notifyListeners();
  }

  set isLactoseFree(bool isLactoseFree) {
    _mealsSettingsBox.put(_isLactoseFree, isLactoseFree);

    notifyListeners();
  }

  set isVegetarian(bool isVegetarian) {
    _mealsSettingsBox.put(_isVegetarian, isVegetarian);

    notifyListeners();
  }

  set isVegan(bool isVegan) {
    _mealsSettingsBox.put(_isVegan, isVegan);

    notifyListeners();
  }

  void resetMealsSettings() {
    _mealsSettingsBox.put(_isGlutenFree, null);
    _mealsSettingsBox.put(_isLactoseFree, null);
    _mealsSettingsBox.put(_isVegetarian, null);
    _mealsSettingsBox.put(_isVegan, null);

    notifyListeners();
  }
}
