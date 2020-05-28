import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function changeTitle;
  AppButton(this.changeTitle);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Click me'),
      onPressed: changeTitle,
    );
  }
}
