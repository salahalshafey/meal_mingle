import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _generalSettingsBox = Hive.box("general_settings");

const _languageCode = "languageCode";
const _themeIsDark = "themeIsDark";
const _color = "color";

class GeneralSettings extends ChangeNotifier {
///////////////////////////// Locale //////////////////////////////

  Locale? get currentLocal {
    final languageCode = _generalSettingsBox.get(_languageCode) as String?;
    if (languageCode == null) {
      return null;
    }

    return Locale(languageCode);
  }

  bool languageIsArabic(BuildContext context) {
    if (currentLocal == null) {
      return Localizations.localeOf(context).languageCode == "ar";
    }

    return currentLocal!.languageCode == "ar";
  }

  void setLanguage(bool isArabic) {
    _generalSettingsBox.put(_languageCode, isArabic ? "ar" : "en");

    notifyListeners();
  }

  ///////////////////////// Theme Mode /////////////////////////

  ThemeMode get themeMode {
    final themeIsDark = _generalSettingsBox.get(_themeIsDark) as bool?;
    if (themeIsDark == null) {
      return ThemeMode.system;
    }

    return themeIsDark ? ThemeMode.dark : ThemeMode.light;
  }

  bool themeIsDark(BuildContext context) {
    if (themeMode == ThemeMode.system) {
      return Theme.of(context).brightness == Brightness.dark;
    }

    return themeMode == ThemeMode.dark;
  }

  void setThemeMode(bool isDark) {
    _generalSettingsBox.put(_themeIsDark, isDark);

    notifyListeners();
  }

  /////////////////////// Color //////////////////////////////

  Color get currentColor {
    final color = _generalSettingsBox.get(_color) as int?;
    if (color == null) {
      return const Color.fromRGBO(95, 190, 30, 1);
    }

    return Color(color);
  }

  bool currentColorIsSameOf(Color color) {
    return currentColor.value == color.value;
  }

  void setColor(Color color) {
    _generalSettingsBox.put(_color, color.value);

    notifyListeners();
  }

  void resetGeneralSettings() {
    _generalSettingsBox.put(_languageCode, null);
    _generalSettingsBox.put(_themeIsDark, null);
    _generalSettingsBox.put(_color, null);

    notifyListeners();
  }
}
