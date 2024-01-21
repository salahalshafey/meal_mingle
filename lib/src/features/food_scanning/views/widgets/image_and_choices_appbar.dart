import 'dart:io';
import 'package:flutter/material.dart';

import '../../../../core/util/widgets/custom_back_button.dart';
import 'custom_tap.dart';

class ImageAndChoicesAppbar extends StatelessWidget {
  const ImageAndChoicesAppbar({
    super.key,
    required this.imagePath,
    this.includeHero = false,
  });

  final String imagePath;
  final bool includeHero;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        title: ImageWithHero(
          imagePath: imagePath,
          includeHero: includeHero,
        ),
      ),
      leading: const CustomBackButton(includeBackgroundColor: true),
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

class ImageWithHero extends StatelessWidget {
  const ImageWithHero({
    super.key,
    required this.imagePath,
    this.includeHero = false,
  });

  final String imagePath;
  final bool includeHero;

  @override
  Widget build(BuildContext context) {
    return includeHero
        ? Hero(
            tag: imagePath,
            child: Image.file(
              File(imagePath),
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
        : Image.file(
            File(imagePath),
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
          );
  }
}
