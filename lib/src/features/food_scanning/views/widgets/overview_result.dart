import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../core/util/functions/string_manipulations_and_search.dart';
import '../../../../core/util/widgets/note_description.dart';

class OverviewResult extends StatelessWidget {
  const OverviewResult({
    super.key,
    required this.result,
  });

  final String result;

  @override
  Widget build(BuildContext context) {
    //  style: Theme.of(context).textTheme.bodyLarge,
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10)
          .add(const EdgeInsets.only(bottom: 120)),
      child: NoteDescription(
        icon: Icon(
          Icons.description,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: "Unveiling Contents and Caloric Breakdown",
        child: Directionality(
          textDirection: getDirectionalityOf(result),
          child: MarkdownBody(data: result),
        ),
      ).animate(delay: 200.ms).slideY(begin: -0.07).fadeIn(),
    );
  }
}
