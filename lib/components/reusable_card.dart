import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // prop for changing color later
  final Color colour;

  // 7.1a custom property
  final Widget cardChild;

  // 12.2a add func to handle tap
  final Function onPress;

  // constr - make mandatory with @required annotation
  // 12.2b add onPress func to constr
  ReusableCard({
    @required this.colour,
    this.cardChild, // 7.1b
    this.onPress, //12.2b no () !!
  });

  @override
  Widget build(BuildContext context) {
    // 12.1 wrap container in GestureDetector
    return GestureDetector(
      onTap: onPress, //12.2c  relate onTap with onPress
      child: Container(
        child: cardChild, // 7.2
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
