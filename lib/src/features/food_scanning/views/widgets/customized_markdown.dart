import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../core/util/functions/string_manipulations_and_search.dart';

class CustomizedMarkdown extends StatelessWidget {
  const CustomizedMarkdown({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: getDirectionalityOf(data),
      child: MarkdownBody(
        data: data,
        styleSheet: MarkdownStyleSheet(
          listBulletPadding: const EdgeInsets.all(5),
          blockSpacing: 20,
        ),
      ),
    );
  }
}
