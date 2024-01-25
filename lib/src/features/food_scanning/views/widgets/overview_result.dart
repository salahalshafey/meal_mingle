import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/util/widgets/note_description.dart';
import 'customized_markdown.dart';

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
        child: CustomizedMarkdown(data: result),
      ).animate(delay: 200.ms).slideY(begin: -0.07).fadeIn(),
    );
  }
}
