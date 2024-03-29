import 'package:flutter/material.dart';
import 'package:meal_mingle/l10n/l10n.dart';

import '../../../../../core/util/functions/string_manipulations_and_search.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.controller,
    required this.setMealName,
  });

  final TextEditingController controller;
  final void Function(String mealName) setMealName;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _focusNode = FocusNode();
  late TextDirection _textDirection;

  void _initAutofocus() async {
    await Future.delayed(const Duration(milliseconds: 400));

    if (mounted) {
      _focusNode.requestFocus();
    }
  }

  @override
  void initState() {
    _initAutofocus();

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _textDirection = getDirectionalityOf(widget.controller.text);

    return SizedBox(
      height: 50,
      child: TextField(
        key: const ValueKey('search'),
        focusNode: _focusNode,
        autocorrect: false,
        enableSuggestions: true,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        textDirection: _textDirection,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: Strings.of(context).searchMealsUsingAi,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    widget.controller.clear();
                    _focusNode.requestFocus();
                    setState(() {});
                  },
                  icon: const Icon(Icons.close),
                  tooltip: Strings.of(context).clear,
                )
              : null,
        ),
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
        onChanged: (value) {
          setState(() {});
        },
        onSubmitted: (value) {
          if (widget.controller.text.trim().isEmpty) {
            _focusNode.requestFocus();
            return;
          }

          widget.setMealName(widget.controller.text.trim());
        },
      ),
    );
  }
}
