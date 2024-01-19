import 'package:flutter/material.dart';

import '../functions/string_manipulations_and_search.dart';
import 'custom_card.dart';

class NoteDescription extends StatelessWidget {
  const NoteDescription({
    required this.icon,
    required this.title,
    this.description,
    this.titleStyle,
    this.descriptionStyle,
    this.child,
    super.key,
  });

  final Widget icon;
  final String title;
  final String? description;

  /// if null it will be TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
  final TextStyle? titleStyle;

  /// if null it will be TextStyle(fontSize: 16, color: Colors.grey.shade600)
  final TextStyle? descriptionStyle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(25),
      elevation: 5,
      onTap: () {},
      child: Column(
        children: [
          Row(
            // textDirection: TextDirection.rtl, // for arabic languge
            children: [
              icon,
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: titleStyle ??
                      const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            description ?? "",
            textDirection: getDirectionalityOf(description ?? ""),
            textAlign: TextAlign.justify,
            style: descriptionStyle ??
                TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          if (child != null) ...[const SizedBox(height: 10), child!],
        ],
      ),
    );
  }
}
