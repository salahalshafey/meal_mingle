import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingSearchInTheImage extends StatelessWidget {
  const LoadingSearchInTheImage({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final screenHeight = MediaQuery.of(context).size.height;
    const scanHeight = 150.0;
    final offset = (screenHeight / scanHeight).ceilToDouble();
    final duration = offset.seconds * 0.5;

    return Container(
      color: Colors.black,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.file(File(imagePath)),
            Scanner(
              scanHeight: scanHeight,
              color: color,
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .slideY(
                  duration: duration,
                  begin: offset,
                  end: -offset,
                )
                .fadeOut(delay: duration),
            Scanner(
              scanHeight: scanHeight,
              color: color,
              reversed: true,
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .slideY(
                  delay: duration,
                  duration: duration,
                  begin: -offset,
                  end: offset,
                )
                .fadeOut(delay: duration),
          ],
        ),
      ),
    );
  }
}

class Scanner extends StatelessWidget {
  const Scanner({
    super.key,
    required this.scanHeight,
    required this.color,
    this.reversed = false,
  });

  final double scanHeight;
  final Color color;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: scanHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: reversed ? Alignment.bottomCenter : Alignment.topCenter,
          end: reversed ? Alignment.topCenter : Alignment.bottomCenter,
          colors: [
            color,
            color.withOpacity(0.55),
            color.withOpacity(0.51),
            color.withOpacity(0.47),
            color.withOpacity(0.44),
            color.withOpacity(0.41),
            color.withOpacity(0.38),
            color.withOpacity(0.35),
            color.withOpacity(0.32),
            color.withOpacity(0.29),
            color.withOpacity(0.26),
            color.withOpacity(0.23),
            color.withOpacity(0.20),
            color.withOpacity(0.15),
            color.withOpacity(0.12),
            color.withOpacity(0.09),
            color.withOpacity(0.06),
            color.withOpacity(0.03),
          ],
        ),
      ),
    );
  }
}
