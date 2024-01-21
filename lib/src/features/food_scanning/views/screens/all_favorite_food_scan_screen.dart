import 'package:flutter/material.dart';
import '../../data/models/food_scanning_result_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/widgets/custom_back_button.dart';

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

          //  return AllFavoritesGrid(allFavorites: allFavorites);
          return GridView.builder(
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
          );
        },
      ),
    );
  }
}

/*class AllFavoritesGrid extends StatefulWidget {
  const AllFavoritesGrid({
    super.key,
    required this.allFavorites,
  });

  final List<FoodScanningResultModel> allFavorites;

  @override
  State<AllFavoritesGrid> createState() => _AllFavoritesGridState();
}

class _AllFavoritesGridState extends State<AllFavoritesGrid> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _removeItem(int index) {
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => FadeTransition(
        opacity: animation,
        child: FoodScanItem(
          favoriteId: widget.allFavorites[index].id,
          imagePath: widget.allFavorites[index].imagePath,
          overview: widget.allFavorites[index].resultOverview,
          dateTime: widget.allFavorites[index].dateTime,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedGrid(
      key: _listKey,
      initialItemCount: widget.allFavorites.length,
      itemBuilder: (context, index, animation) {
        return FadeTransition(
          opacity: animation,
          child: FoodScanItem(
            favoriteId: widget.allFavorites[index].id,
            imagePath: widget.allFavorites[index].imagePath,
            overview: widget.allFavorites[index].resultOverview,
            dateTime: widget.allFavorites[index].dateTime,
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
}*/
