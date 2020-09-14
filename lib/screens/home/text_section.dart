import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String _title;
  final String _body;
  static const double _sidePadding = 16.0;

  TextSection(this._title, [this._body]);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              _sidePadding, 32.0, _sidePadding, _sidePadding),
          child: Text(_title),
        ),

        if (this._body != null)
          Container(
            padding: const EdgeInsets.fromLTRB(
                _sidePadding, 10.0, _sidePadding, 4.0),
            child: Text(_body),
          ),

        //Text(_body),
      ],
    );
  }
}
