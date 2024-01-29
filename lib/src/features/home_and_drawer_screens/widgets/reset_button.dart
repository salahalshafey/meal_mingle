import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key, required this.reset});

  final void Function() reset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 15),
      child: IconButton(
        tooltip: Strings.of(context).resetToDefault, //"Reset to default",
        onPressed: reset,
        icon: const Icon(Icons.restart_alt),
      ),
    );
  }
}
