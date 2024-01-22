// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../core/util/builders/custom_alret_dialog.dart';
import '../../../../../core/util/builders/custom_snack_bar.dart';
import '../../../../../core/util/functions/string_manipulations_and_search.dart';
import '../../providers/favorites_food_scan.dart';

class ScanImage extends StatelessWidget {
  const ScanImage(this.imagePath, {super.key});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Hero(
        tag: imagePath,
        child: Image.file(
          File(imagePath),
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    ).animate(delay: 100.ms).fadeIn(duration: 1000.ms);
  }
}

class ScanOverview extends StatelessWidget {
  const ScanOverview(this.overview, {super.key});

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(40)),
        color: Colors.black54,
      ),
      width: 300,
      // color: Colors.black45,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 5,
      ),
      child: Text(
        overview,
        textDirection: getDirectionalityOf(overview),
        maxLines: 3,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        softWrap: true,
        overflow: TextOverflow.fade,
      ),
    )
        .animate(delay: 300.ms)
        .slideX(
          duration: 500.ms,
          begin: appCurrentDirectionalityIsRtl() ? 0.5 : -0.5,
        )
        .fadeIn();
  }
}

class DeleteFromFavoriteButton extends StatelessWidget {
  const DeleteFromFavoriteButton(
    this.favoriteId,
    this.removeItem, {
    super.key,
  });

  final void Function(int index) removeItem;
  final String favoriteId;

  void _deleteFromFavorite(BuildContext context) async {
    final delete = await showCustomAlretDialog<bool>(
      context: context,
      constraints: const BoxConstraints(maxWidth: 500),
      title: "Confirm Remove?",
      titleColor: Colors.red,
      contentPadding: const EdgeInsets.all(20),
      content:
          "Are you sure you want to remove this Scan result from Favorites?",
      actionsBuilder: (builderContext) => [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text(
            "Remove",
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );

    if (delete == null || delete == false) {
      return;
    }

    try {
      final index = await Provider.of<FavoritesFoodScan>(context, listen: false)
          .deleteFavorite(favoriteId);

      removeItem(index);
    } catch (error) {
      showCustomSnackBar(context: context, content: error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: FittedBox(
        child: FloatingActionButton(
            heroTag: null,
            tooltip: "Remove from favorites",
            // backgroundColor: Colors.white,
            onPressed: () => _deleteFromFavorite(context),
            child: const Icon(
              Icons.favorite_rounded,
              color: Colors.pink,
            )),
      ),
    )
        .animate(delay: 500.ms)
        .slideX(begin: appCurrentDirectionalityIsRtl() ? -1.5 : 1.5)
        .fade();
  }
}

class ScanDate extends StatelessWidget {
  const ScanDate(this.dateTime, {super.key});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.date_range),
        const SizedBox(width: 10),
        Text(
          intl.DateFormat(
            "d MMMM, yyy",
            Localizations.localeOf(context).languageCode,
          ).format(dateTime),
        ),
      ],
    ).animate(delay: 800.ms).slideY(duration: 500.ms, begin: 1).fadeIn();
  }
}

class NumberOfQuestionResultsChecked extends StatelessWidget {
  const NumberOfQuestionResultsChecked(this.favoriteId, {super.key});

  final String favoriteId;

  @override
  Widget build(BuildContext context) {
    final questionsResults =
        Provider.of<FavoritesFoodScan>(context, listen: false)
            .getFavoriteById(favoriteId)
            .questionsResults;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: questionsResults
          .map(
            (result) => result == null
                ? const Icon(Icons.check)
                : Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  ),
          )
          .toList(),
    )
        .animate(delay: 800.ms)
        .slideY(duration: 500.ms, begin: 1)
        .fadeIn()
        .then()
        .flipH();
  }
}
