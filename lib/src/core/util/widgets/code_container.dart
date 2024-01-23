import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CodeContainer extends StatelessWidget {
  const CodeContainer({
    super.key,
    required this.code,
    required this.languageName,
    this.fontSize,
    this.animateTheCode = false,
  });

  final String code;
  final String languageName;
  final double? fontSize;
  final bool animateTheCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.black,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey.shade800,
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                Text(
                  languageName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize == null ? 12 : fontSize! - 2,
                  ),
                ),
                CopyCode(
                  code: code,
                  fontSize: fontSize == null ? 12 : fontSize! - 2,
                ),
              ],
            ),
          ),
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: Directionality.of(context) == TextDirection.rtl,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: animateTheCode
                  ? Animate().custom(
                      duration: (code.length * 10).ms,
                      begin: 0,
                      end: code.length.toDouble(),
                      builder: (_, value, __) {
                        return SelectableText(
                          code.substring(0, value.toInt()),
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                        );
                      },
                    )
                  : SelectableText(
                      code,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class CopyCode extends StatefulWidget {
  const CopyCode({
    super.key,
    required this.code,
    required this.fontSize,
  });

  final String code;
  final double fontSize;

  @override
  State<CopyCode> createState() => _CopyCodeState();
}

class _CopyCodeState extends State<CopyCode> {
  bool _isCopyed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _isCopyed
          ? () {}
          : () async {
              await Clipboard.setData(ClipboardData(text: widget.code));

              setState(() {
                _isCopyed = true;
              });

              Future.delayed(
                const Duration(seconds: 3),
                () {
                  setState(() {
                    _isCopyed = false;
                  });
                },
              );
            },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _isCopyed ? Icons.check : Icons.paste_rounded,
            color: Colors.white,
            size: widget.fontSize + 4,
          ),
          const Text("  "),
          Text(
            _isCopyed
                ? AppLocalizations.of(context)!.copid
                : AppLocalizations.of(context)!.copyCode,
            style: TextStyle(
              color: Colors.white,
              fontSize: widget.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
