import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.includeBackgroundColor = false,
  });

  final bool includeBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Back",
      iconSize: 28,
      icon: const Icon(Icons.arrow_back_ios_rounded),
      color: includeBackgroundColor ? Colors.black : null,
      style: includeBackgroundColor
          ? ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            )
          : null,
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
