import 'package:flutter/material.dart';

class MealImage extends StatelessWidget {
  const MealImage(this.imageUrl, {super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Hero(
        tag: imageUrl,
        child: Image.network(
          imageUrl,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (ctx, error, stk) {
            return const SizedBox(
              height: 250,
              width: double.infinity,
              child: Icon(
                Icons.restaurant_rounded,
                size: 80,
                textDirection: TextDirection.ltr,
              ),
            );
          },
        ),
      ),
    );
  }
}
