import 'package:flutter/material.dart';

import '../../../../../core/util/widgets/custom_card.dart';

import '../../../data/models/ingredient.dart';
import '../../../data/models/mesauring_icon_icons.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  final Ingredients ingredient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 250,
      child: CustomCard(
        borderRadius: BorderRadius.circular(30),
        elevation: 3,
        onTap: () {},
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Transform.flip(
                flipX: Directionality.of(context) == TextDirection.rtl,
                child: Image.network(
                  ingredient.ingredientImage,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                  errorBuilder: (ctx, error, stk) {
                    return const SizedBox(
                      height: 80,
                      width: 80,
                      child: Icon(
                        Icons.restaurant_rounded,
                        size: 35,
                        textDirection: TextDirection.ltr,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                ingredient.ingredientName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 8),
                    child: Icon(MesauringIcon.measuringSpoons),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    ingredient.ingredientAmount,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
