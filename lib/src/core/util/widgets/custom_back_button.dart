import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.includeBackgroundColor = false,
  });

  final bool includeBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: AppLocalizations.of(context)!.back,
      iconSize: 28,
      icon: const Icon(Icons.arrow_back_ios_rounded),
      color: includeBackgroundColor ? Colors.black : null,
      style: includeBackgroundColor
          ? ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            )
          : null,
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
