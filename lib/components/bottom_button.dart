import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

// 17.11 bzw. 17.11(e)
class BottomButton extends StatelessWidget {
  //17.11(b) - new props to handle both input_screen & results_screen
  final Function onTap;
  final String buttonTitle;

  //17.11(c) add constr with props
  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    // 16.3 wrap Container in GestureDetector and add route
    return GestureDetector(
      onTap: onTap, // 17.11(c)
      child: Container(
        //17.2
        child: Center(
          // 16.2 & 17.1b
          child: Text(
            buttonTitle, // 17.11(c)
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 15.0), // 17.3
      ),
    );
  }
}
