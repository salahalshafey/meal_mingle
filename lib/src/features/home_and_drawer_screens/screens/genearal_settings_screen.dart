import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/l10n.dart';
import '../../../core/util/widgets/custom_back_button.dart';

import '../providers/general_settings_provider.dart';
import '../widgets/color_picker.dart';
import '../widgets/cusom_switch.dart';
import '../widgets/reset_button.dart';

class GeneralSettingsScreen extends StatelessWidget {
  const GeneralSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(),
        title: Text(
          Strings.get.generalSettings,
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
                title: Strings.get.language,
                subtitle: Strings.get.displayArabicLanguage,
                currentValue: provider.languageIsArabic(context),
                onChanged: provider.setLanguage,
              );
            },
          ),
          const SizedBox(height: 20),
          Consumer<GeneralSettings>(
            builder: (ctx, provider, child) {
              return CusomSwitch(
                title: Strings.get.themeMode,
                subtitle: Strings.get.displayDarkTheme,
                currentValue: provider.themeIsDark(context),
                onChanged: provider.setThemeMode,
              );
            },
          ),
          const SizedBox(height: 20),
          const ColorPicker(),
          // add color scheme sellection
        ],
      ),
    );
  }
}
