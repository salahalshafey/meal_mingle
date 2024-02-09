import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';

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
      bottom: TabBar(
        isScrollable: true,
        tabs: [
          CustomTap(Strings.of(context).overview),
          CustomTap(Strings.of(context).nutritionalEvaluation),
          CustomTap(Strings.of(context).comprehensiveNutritionAnalysis),
          CustomTap(Strings.of(context).ingredientInquiry),
          CustomTap(Strings.of(context).howToPrepareIt),
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
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: Icon(
                    Icons.broken_image_rounded,
                    size: 55,
                  ),
                );
              },
            ),
          )
        : Image.file(
            File(imagePath),
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                height: 350,
                width: double.infinity,
                child: Icon(
                  Icons.broken_image_rounded,
                  size: 55,
                ),
              );
            },
          );
  }
}
