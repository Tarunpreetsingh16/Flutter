import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  String _text;

  Title(this._text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        _text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
