import 'package:flutter/material.dart';
import 'constants.dart'; // 13.2d

// 8.4
class IconContent extends StatelessWidget {
  // 8.4
  final IconData cardIcon; // ATTN! .mars needs IconData Type!
  final String label;

  IconContent({this.cardIcon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(cardIcon, size: 80.0), // 8.4
        SizedBox(
          height: 15.0,
        ),
        Text(
          label, // 8.4
          style: kLabelTextStyle, // 8.6
        )
      ],
    );
  }
}
