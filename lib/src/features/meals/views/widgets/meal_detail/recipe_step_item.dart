import 'package:flutter/material.dart';

class RecipeStepItem extends StatelessWidget {
  const RecipeStepItem({
    super.key,
    required this.step,
    required this.stepNumber,
  });

  final String step;
  final int stepNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
            child: Text('# $stepNumber'),
          ),
          title: Text(
            step,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
