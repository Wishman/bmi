import 'package:flutter/material.dart';

// 8.6 move LabelTextStyle here for quick updating
const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8d8E98));

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
          style: labelTextStyle, // 8.6
        )
      ],
    );
  }
}
