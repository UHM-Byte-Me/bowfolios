import 'package:flutter/material.dart';

class ImagePlacement extends StatelessWidget {
  final String _imagePath;

  ImagePlacement(this._imagePath);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 250.0,
      ),
      decoration: BoxDecoration(color: Colors.grey),
      child: Image.asset(
        _imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
