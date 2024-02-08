import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meal_mingle/l10n/l10n.dart';

import '../../../../core/util/widgets/custom_back_button.dart';
import '../../data/models/food_scanning_result_model.dart';

import '../providers/favorites_food_scan.dart';
import '../widgets/favorite_food_scan/food_scan_item.dart';

class AllFavoriteFoodScanScreen extends StatelessWidget {
  const AllFavoriteFoodScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: FutureBuilder(
        future: Provider.of<FavoritesFoodScan>(context, listen: false)
            .fetchAllFavorites(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final allFavorites = Provider.of<FavoritesFoodScan>(ctx).allFavorites;

          if (allFavorites.isEmpty) {
            return Center(
              child: Text(
                Strings.of(context).youHaveNoFavoritesYetStartAddingSome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }

          return AllFavoritesGrid(allFavorites);
        },
      ),
    );
  }
}

class AllFavoritesGrid extends StatefulWidget {
  const AllFavoritesGrid(this.allFavorites, {super.key});

  final List<FoodScanningResultModel> allFavorites;

  @override
  State<AllFavoritesGrid> createState() => _AllFavoritesGridState();
}

class _AllFavoritesGridState extends State<AllFavoritesGrid> {
  final GlobalKey<AnimatedGridState> _gridKey = GlobalKey<AnimatedGridState>();

  void _removeItem(int index) {
    _gridKey.currentState!.removeItem(
      index,
      duration: const Duration(milliseconds: 500),
      (context, animation) => ScaleTransition(
        scale: animation,
        child: FoodScanItem(
          favoriteId: widget.allFavorites.first.id,
          imagePath: widget.allFavorites.first.imagePath,
          overview: widget.allFavorites.first.resultOverview,
          dateTime: widget.allFavorites.first.dateTime,
          removeItem: _removeItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedGrid(
      key: _gridKey,
      initialItemCount: widget.allFavorites.length,
      itemBuilder: (context, index, animation) {
        return ScaleTransition(
          scale: animation,
          child: FoodScanItem(
            favoriteId: widget.allFavorites[index].id,
            imagePath: widget.allFavorites[index].imagePath,
            overview: widget.allFavorites[index].resultOverview,
            dateTime: widget.allFavorites[index].dateTime,
            removeItem: _removeItem,
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 800,
        crossAxisSpacing: 15,
        mainAxisExtent: 350,
      ),
    );
  }
}
//////////////////////////////////////
///////
////

   /* return GridView.builder(
            itemCount: allFavorites.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 800,
              crossAxisSpacing: 15,
              mainAxisExtent: 350,
            ),
            itemBuilder: (gridCtx, index) {
              return FoodScanItem(
                favoriteId: allFavorites[index].id,
                imagePath: allFavorites[index].imagePath,
                overview: allFavorites[index].resultOverview,
                dateTime: allFavorites[index].dateTime,
              );
            },
          );*/