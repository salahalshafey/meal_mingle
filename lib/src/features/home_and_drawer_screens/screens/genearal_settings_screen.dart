import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/l10n.dart';
import '../../../core/util/widgets/custom_back_button.dart';

import '../providers/general_settings_provider.dart';
import '../widgets/color_picker.dart';
import '../widgets/cusom_switch.dart';
import '../widgets/reset_button.dart';

class GeneralSettingsScreen extends StatelessWidget {
  static const routeName = '/General-Settings_Screen';

  const GeneralSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(),
        title: Text(
          Strings.of(context).generalSettings,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          ResetButton(
            reset: Provider.of<GeneralSettings>(context, listen: false)
                .resetGeneralSettings,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        children: [
          Consumer<GeneralSettings>(
            builder: (ctx, provider, child) {
              return CusomSwitch(
                title: Strings.of(context).language,
                subtitle: Strings.of(context).displayArabicLanguage,
                currentValue: provider.languageIsArabic(context),
                onChanged: provider.setLanguage,
              );
            },
          ),
          const SizedBox(height: 20),
          Consumer<GeneralSettings>(
            builder: (ctx, provider, child) {
              return CusomSwitch(
                title: Strings.of(context).themeMode,
                subtitle: Strings.of(context).displayDarkTheme,
                currentValue: provider.themeIsDark(context),
                onChanged: provider.setThemeMode,
              );
            },
          ),
          const SizedBox(height: 20),
          Consumer<GeneralSettings>(
            builder: (ctx, provider, child) {
              return ColorPicker(
                colorsCircleRadius: 50,
                spacingBetweenColorsItems: 4.0,
                rowsMainAxisAlignment: MainAxisAlignment.center,
                currentColor: provider.currentColor,
                onSelected: provider.setColor,
              );
            },
          ),
          // add color scheme sellection
        ],
      ),
    );
  }
}
