import 'constants.dart';
import 'package:flutter/material.dart';

class boxContent extends StatelessWidget {
  final String boxText;
  final IconData boxIcon;
  boxContent({this.boxIcon, this.boxText});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          boxIcon,
          size: 80.0,
          color: Color(0xFFFFFFFF),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          boxText,
          style: labelStyle,
        ),
      ],
    );
  }
}