import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

import '../classes/pair_class.dart';
import '../functions/string_manipulations_and_search.dart';
import 'bulleted_list.dart';
import 'code_container.dart';

class TextWellFormattedWithBulleted extends StatelessWidget {
  const TextWellFormattedWithBulleted({
    super.key,
    required this.data,
    this.fontSize,
    this.isSelectableText = false,
  });

  final String data;
  final double? fontSize;
  final bool isSelectableText;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: getDirectionalityOf(data),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: patternMatcher(
          data,
          patterns: [
            // bulleted
            RegExp(
              r'^(\s*[-*+]\s+|(\d+\.)\s+).*', //
              multiLine: true,
              dotAll: false,
            ),

            // code
            RegExp(
              r"^```.*?```",
              multiLine: true,
              dotAll: true,
            ),

            // table
            RegExp(
              r'^\s*\|.*\|\s*$\n^\s*\|(?::?-+:?\s*\|)+\s*$\n(\s*\|.*\|\s*$\n)*',
              multiLine: true,
            ),
          ],
          types: [
            StringTypes.bulleted,
            StringTypes.code,
            StringTypes.table,
            StringTypes.normal,
          ],
        ).map((inlineString) {
          if (inlineString.type == StringTypes.code) {
            final code = _getCodeAndlanguageName(inlineString.string);

            return CodeContainer(
              code: code.first,
              languageName: code.second,
              fontSize: fontSize,
              animateTheCode: false,
            );
          }

          if (inlineString.type == StringTypes.table) {
            return ParseMarkdownTable(
              table: inlineString.string,
              fontSize: fontSize,
              isSelectableText: isSelectableText,
              textDirection: getDirectionalityOf(inlineString.string),
            );
          }

          if (inlineString.type == StringTypes.bulleted) {
            // bulleted
            if (inlineString.string.startsWith(
              RegExp(
                r'^(\s*[-*+]\s+)',
                multiLine: true,
                dotAll: false,
              ),
            )) {
              return BulletedList(
                textDirection: getDirectionalityOf(data),
                text: TextWellFormattedWitouthBulleted(
                  data: inlineString.string.replaceFirst(
                    RegExp(
                      r'^(\s*[-*+]\s+)',
                      multiLine: true,
                      dotAll: false,
                    ),
                    "",
                  ),
                  fontSize: fontSize,
                  isSelectableText: isSelectableText,
                  textDirection: getDirectionalityOf(inlineString.string),
                ),
              );
            }

            // if bulleted number
            return BulletedList(
              textDirection: getDirectionalityOf(data),
              // the bullet is the number
              bullet: Text(
                inlineString.string.firstMatch(
                  RegExp(
                    r'\d+\.',
                    multiLine: true,
                    dotAll: false,
                  ),
                ),
                style: TextStyle(fontSize: fontSize),
              ),
              bulletMargin: const EdgeInsetsDirectional.only(
                end: 10,
                start: 20,
              ),
              text: TextWellFormattedWitouthBulleted(
                data: inlineString.string.replaceFirst(
                  RegExp(
                    r'^(\s*(\d+\.)\s+)', //
                    multiLine: true,
                    dotAll: false,
                  ),
                  "",
                ),
                fontSize: fontSize,
                isSelectableText: isSelectableText,
                textDirection: getDirectionalityOf(inlineString.string),
              ),
            );
          }

          return TextWellFormattedWitouthBulleted(
            data: inlineString.string,
            fontSize: fontSize,
            isSelectableText: isSelectableText,
            textDirection: getDirectionalityOf(inlineString.string),
          );
        }).toList(),
      ),
    );
  }
}

class TextWellFormattedWitouthBulleted extends StatefulWidget {
  const TextWellFormattedWitouthBulleted({
    super.key,
    required this.data,
    this.fontSize,
    this.isSelectableText = false,
    required this.textDirection,
  });

  final String data;
  final double? fontSize;
  final bool isSelectableText;
  final TextDirection? textDirection;

  @override
  State<TextWellFormattedWitouthBulleted> createState() =>
      _TextWellFormattedWitouthBulletedState();
}

class _TextWellFormattedWitouthBulletedState
    extends State<TextWellFormattedWitouthBulleted> {
  int? _enteredSpanIndex;

  TapGestureRecognizer _customTapGestureRecognizerOf(int enteredSpanIndex) {
    return TapGestureRecognizer()
      ..onTapDown = (details) {
        setState(() {
          _enteredSpanIndex = enteredSpanIndex;
        });
      }
      ..onTapCancel = () {
        setState(() {
          _enteredSpanIndex = null;
        });
      }
      ..onTapUp = (_) {
        setState(() {
          _enteredSpanIndex = null;
        });
      };
  }

  TextSpan _getTextSpan(BuildContext context) {
    int i = 0;

    return TextSpan(
      style: TextStyle(fontSize: widget.fontSize),
      children: patternMatcher(
        widget.data,
        patterns: [
          // bold
          RegExp(
            r"\*\*.*?\*\*",
            multiLine: true,
            dotAll: true,
          ),

          // highlighted
          RegExp(
            r"`.+?`",
            multiLine: true,
            dotAll: true,
          ),

          // url
          RegExp(
            r"(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})",
          ),

          // email
          RegExp(
            r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}",
          ),

          // phone number (Egypt or global)
          RegExp(
            r"(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{2,3}\)?[\s.-]?\d{3,4}[\s.-]?\d{3,5}", // (01[0125][0-9]{8})|
          ),
        ],
        types: [
          StringTypes.bold,
          StringTypes.highlighted,
          StringTypes.url,
          StringTypes.email,
          StringTypes.phoneNumber,
          StringTypes.normal,
        ],
      ).map((inlineText) {
        final currentSpanIndex = i++;

        if (inlineText.type == StringTypes.url) {
          return TextSpan(
            text: inlineText.string,
            style: TextStyle(
              fontSize: widget.fontSize?.plusOne ?? 15,
              color: Colors.blue,
              backgroundColor: _enteredSpanIndex == currentSpanIndex
                  ? Theme.of(context).colorScheme.secondary.withOpacity(0.5)
                  : null,
              // decoration: TextDecoration.underline,
              //  decorationColor: Colors.blue,
            ),
            recognizer: _customTapGestureRecognizerOf(currentSpanIndex)
              ..onTap = () {
                final link = inlineText.string;

                launchUrl(
                  Uri.parse(link.startsWith('www.') ? 'https:$link' : link),
                  mode: LaunchMode.externalApplication,
                );
              },
          );
        }

        if (inlineText.type == StringTypes.email) {
          return TextSpan(
            text: inlineText.string,
            style: TextStyle(
              fontSize: widget.fontSize?.plusOne ?? 15,
              color: Colors.blue,
              backgroundColor: _enteredSpanIndex == currentSpanIndex
                  ? Theme.of(context).colorScheme.secondary.withOpacity(0.5)
                  : null,
              // decoration: TextDecoration.underline,
              // decorationColor: Colors.blue,
            ),
            recognizer: _customTapGestureRecognizerOf(currentSpanIndex)
              ..onTap = () {
                launchUrl(Uri.parse('mailto:${inlineText.string}'));
              },
          );
        }

        if (inlineText.type == StringTypes.bold) {
          return TextSpan(
            text: inlineText.string.substring(2, inlineText.string.length - 2),
            style: TextStyle(
              fontSize: widget.fontSize?.plusOne ?? 15,
              fontWeight: FontWeight.w900,
            ),
          );
        }

        if (inlineText.type == StringTypes.phoneNumber) {
          return TextSpan(
            text: inlineText.string,
            style: TextStyle(
              fontSize: widget.fontSize?.plusOne ?? 15,
              color: Colors.blue,
              backgroundColor: _enteredSpanIndex == currentSpanIndex
                  ? Theme.of(context).colorScheme.secondary.withOpacity(0.5)
                  : null,
            ),
            recognizer: _customTapGestureRecognizerOf(currentSpanIndex)
              ..onTap = () {
                launchUrl(Uri.parse('tel:${inlineText.string}'));
              },
          );
        }

        if (inlineText.type == StringTypes.highlighted) {
          return TextSpan(
            text: inlineText.string.replaceAll("`", " "),
            style: TextStyle(
              fontSize: widget.fontSize?.plusOne ?? 15,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.withOpacity(0.3)
                  : Colors.black,
            ),
          );
        }

        return TextSpan(text: inlineText.string);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isSelectableText
        ? SelectableText.rich(
            _getTextSpan(context),
            textDirection: widget.textDirection,
          )
        : Text.rich(
            _getTextSpan(context),
            textDirection: widget.textDirection,
          );
  }
}

enum StringTypes {
  code,
  bulleted,
  bulletedNumber,

  table,
  url,
  email,
  bold,
  phoneNumber,
  highlighted,
  normal,
}

extension on double {
  double get plusOne => this + 1;
}

extension on String {
  String firstMatch(Pattern pattern) {
    final match = pattern.matchAsPrefix(this)!;

    return substring(match.start, match.end);
  }

  int get numberOfStartingWhiteSpace {
    int numOfWhiteSpace = 0;
    for (final char in characters) {
      if (char != " ") {
        return numOfWhiteSpace;
      }

      numOfWhiteSpace++;
    }

    return numOfWhiteSpace;
  }
}

Pair<String, String> _getCodeAndlanguageName(String code) {
  final codelist = code.split("\n");

  final programmingLanguage = codelist.first.substring(3).trim();

  final theCode = codelist.sublist(1, codelist.length - 1).join("\n");

  return Pair(theCode, programmingLanguage);
}

class ParseMarkdownTable extends StatelessWidget {
  const ParseMarkdownTable({
    super.key,
    required this.table,
    this.fontSize,
    this.isSelectableText = false,
    required this.textDirection,
  });

  final String table;
  final double? fontSize;
  final bool isSelectableText;
  final TextDirection? textDirection;

  List<String> get getRows => table.split("\n")
    ..removeWhere((row) => row.isEmpty)
    ..removeAt(1);

  List<String> getCells(String row) {
    final cells = row.split("|");

    return cells.sublist(1, cells.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    print(getRows);

    return Table(
      border: TableBorder.all(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      textDirection: textDirection,
      children: getRows.map(
        (row) {
          return TableRow(
              children: getCells(row).map(
            (cell) {
              return TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWellFormattedWithBulleted(
                    data: cell,
                    fontSize: fontSize,
                    isSelectableText: isSelectableText,
                  ),
                ),
              );
            },
          ).toList());
        },
      ).toList(),
    );
  }
}
