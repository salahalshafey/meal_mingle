import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/l10n.dart';
import '../../../core/util/widgets/custom_card.dart';
import '../providers/general_settings_provider.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key});

  static const _colors = <Color>[
    Color.fromRGBO(95, 190, 30, 1),
    Colors.blueGrey,
    Colors.red,
    Colors.pink,
    Colors.purpleAccent,
    Colors.indigo,
    Color.fromRGBO(224, 168, 0, 1),
    Colors.blue,
    Colors.teal,
    Colors.lime,
    Colors.deepOrangeAccent,
    Colors.brown,
  ];

  /// ## Don't use this function if [_colors] is not 12 in length.
  ///
  int _fixedCountForEachRowFor12ColorsLength(int count) {
    if (count >= 12) {
      return count;
    }

    if (count >= 6) {
      return 6;
    }

    if (count == 5) {
      return 4;
    }

    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: CustomCard(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(15),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              int countForEachRow = (constraints.maxWidth ~/ 76);
              if (countForEachRow == 0) {
                countForEachRow = 1;
              }

              countForEachRow =
                  _fixedCountForEachRowFor12ColorsLength(countForEachRow);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.get.color,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  for (int i = 0; i < _colors.length; i += countForEachRow)
                    ColorsRow(
                      colors: _colors,
                      fromIndex: i,
                      toIndex: min(i + countForEachRow, _colors.length),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ColorsRow extends StatelessWidget {
  const ColorsRow({
    super.key,
    required this.colors,
    required this.fromIndex,
    required this.toIndex,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  final List<Color> colors;
  final int fromIndex;
  final int toIndex;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: colors
          .sublist(fromIndex, toIndex)
          .map(
            (color) => Consumer<GeneralSettings>(
              builder: (ctx, provider, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () => provider.setColor(color),
                    icon: provider.currentColorIsSameOf(color)
                        ? const Icon(Icons.check, color: Colors.white)
                        : const SizedBox(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(color),
                      fixedSize: const MaterialStatePropertyAll(Size(60, 60)),
                    ),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }
}

////////////////////////////////////////////////////////////////////
/////////////////////////////////////
/////

class ColorPickerFromGrid extends StatelessWidget {
  const ColorPickerFromGrid({super.key});

  static const _colors = <Color>[
    Color.fromRGBO(95, 190, 30, 1),
    Colors.blueGrey,
    Colors.red,
    Colors.pink,
    Colors.purpleAccent,
    Colors.indigo,
    Color.fromRGBO(224, 168, 0, 1),
    Colors.blue,
    Colors.teal,
    Colors.lime,
    Colors.deepOrangeAccent,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Color",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  //  crossAxisCount: 6,
                  maxCrossAxisExtent: 60,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  // mainAxisExtent: 50,
                ),
                children: _colors
                    .map((color) => IconButton(
                          onPressed: () {},
                          icon: const SizedBox(),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(color)),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
