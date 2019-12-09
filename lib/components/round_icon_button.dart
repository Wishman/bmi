import 'package:flutter/material.dart';

// 15.4 & 17.11 (f)
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onTapped}); // 15.8b constr for child & 15.10b
  final IconData icon; // 15.8a IconDATA, not just Icon
  final Function onTapped; // 15.10a

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon), //15.8c
      //15.7 add elevation-> without onPressed - Button is in disabled state!! add empty onPressed()
      onPressed: onTapped, // 15.10c
      elevation: 6.0, // 15.6
      shape: CircleBorder(), // make it round
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // alternate rounded rect look for
      // button
      fillColor: Color(0xFF4C4f5E),
      // 15.6 add Size constraint as per RawMaterialButton implementation (just copy from there)
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
