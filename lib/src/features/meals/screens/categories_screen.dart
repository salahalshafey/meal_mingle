import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //  crossAxisCount: 2,
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: 210,
      ),
      children: dummyData
          .map((catData) => CategoryItem(
                catData.title,
                catData.color,
                catData.id,
                catData.image,
              ))
          .toList(),
    );
  }
}
