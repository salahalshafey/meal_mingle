import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../../../core/util/widgets/note_description.dart';
import '../../providers/food_scan.dart';

import '../customized_markdown.dart';

class ChoiceResult extends StatelessWidget {
  const ChoiceResult({
    required this.questionIndex,
    required this.title,
    required this.icon,
    super.key,
  });

  final int questionIndex;
  final String title;
  final IconData icon;

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
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10)
              .add(const EdgeInsets.only(bottom: 120)),
          child: NoteDescription(
            icon: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: title,
            child: CustomizedMarkdown(data: questionResult),
          ).animate(delay: 200.ms).slideY(begin: -0.07).fadeIn(),
        );
      },
    );
  }
}
