import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // prop for changing color later
  final Color colour;

  // 7.1a custom property
  final Widget cardChild;

  // constr - make mandatory with @required annotation
  ReusableCard({
    @required this.colour,
    this.cardChild, // 7.1b
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild, // 7.2
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
