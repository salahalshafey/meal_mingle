import 'package:flutter/material.dart';

class CustomTap extends StatelessWidget {
  const CustomTap(
    this.title, {
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[300],
        ),
        child: FittedBox(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Metrophobic',
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
