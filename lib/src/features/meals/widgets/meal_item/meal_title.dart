import 'package:flutter/material.dart';

class MealTitle extends StatelessWidget {
  const MealTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
        color: Colors.black54,
      ),
      width: 300,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 5,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        softWrap: true,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
