import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../core/functions/string_manipulations_and_search.dart';

class OverviewResult extends StatelessWidget {
  const OverviewResult({
    super.key,
    required this.result,
  });

  final String result;

  @override
  Widget build(BuildContext context) {
    //  style: Theme.of(context).textTheme.bodyLarge,
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Directionality(
        textDirection: getDirectionalityOf(result),
        child: Markdown(data: result),
      ),
    );
  }
}
