import 'package:flutter/material.dart';

class reusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  reusableCard(@required this.colour, this.cardChild);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      color: colour,
      borderRadius: BorderRadius.circular(10.0),
    ),
   );
  }
}