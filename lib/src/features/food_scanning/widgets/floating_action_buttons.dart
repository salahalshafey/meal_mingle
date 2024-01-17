import 'package:flutter/material.dart';

class SaveFoodScanningResultButton extends StatefulWidget {
  const SaveFoodScanningResultButton({
    super.key,
  });

  @override
  State<SaveFoodScanningResultButton> createState() =>
      _SaveFoodScanningResultButtonState();
}

class _SaveFoodScanningResultButtonState
    extends State<SaveFoodScanningResultButton> {
  bool _isVavorite = false;
  void toggleFavorite() {
    setState(() {
      _isVavorite = !_isVavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: Colors.white,
      onPressed: toggleFavorite,
      child: Icon(
        _isVavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: _isVavorite ? Colors.pink : null,
      ),
    );
  }
}

///////////////////////////////////////////
///////////////
/////
class ShareFoodScanningResultButton extends StatelessWidget {
  const ShareFoodScanningResultButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: Colors.white,
      onPressed: () {},
      child: const Icon(Icons.share),
    );
  }
}
