import 'dart:io';
import 'package:flutter/material.dart';

import 'custom_tap.dart';

class ImageAndChoicesAppbar extends StatelessWidget {
  const ImageAndChoicesAppbar({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        title: Image.file(
          File(imagePath),
          height: 350,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      leading: IconButton(
        color: Colors.black,
        iconSize: 28,
        icon: const Icon(Icons.arrow_back_ios_rounded),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).primaryColor.withOpacity(0.5)),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      floating: true,
      pinned: true,
      elevation: 0,
      bottom: const TabBar(
        isScrollable: true,
        tabs: [
          CustomTap("Overview"),
          CustomTap("Nutritional Evaluation"),
          CustomTap("Comprehensive Nutrition Analysis"),
          CustomTap("Ingredient Inquiry"),
          CustomTap("How To Prepare It"),
        ],
      ),
    );
  }
}
