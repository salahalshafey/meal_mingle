import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/functions/string_manipulations_and_search.dart';
import '../providers/food_scan.dart';

class ChoiceResult extends StatelessWidget {
  const ChoiceResult(this.questionIndex, {super.key});

  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<FoodScan>(context, listen: false)
          .getfoodMoreDetails(questionIndex),
      builder: (context, snapshot) {
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

        final questionResult = snapshot.data!;

        //  style: Theme.of(context).textTheme.bodyLarge,
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Directionality(
            textDirection: getDirectionalityOf(questionResult),
            child: Markdown(data: questionResult),
          ),
        );
      },
    );
  }
}
