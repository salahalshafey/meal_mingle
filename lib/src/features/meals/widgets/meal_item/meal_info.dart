import 'package:flutter/material.dart';

class MealInfo extends StatelessWidget {
  final int duration;
  final String complexity;
  final String affordability;

  const MealInfo({
    Key? key,
    required this.duration,
    required this.affordability,
    required this.complexity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            const Icon(Icons.schedule),
            const SizedBox(width: 6),
            Text('$duration min')
          ],
        ),
        Row(
          children: [
            const Icon(Icons.work),
            const SizedBox(width: 6),
            Text(complexity)
          ],
        ),
        Row(
          children: [
            const Icon(Icons.attach_money_rounded),
            const SizedBox(width: 6),
            Text(affordability)
          ],
        )
      ],
    );
  }
}
