import 'package:flutter/material.dart';

// 13.3 refactor constants to start with 'k' as per naming convention

// 8.6 move LabelTextStyle to icon_content.dart for quick updating
//13.2b move to constants.dart for central management
const kLabelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8d8E98));
const kNumberTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900); // 13.7 super bold
// font weight

// 13.2c cut&paste color & bottomContainerHeight from input_page to constants.dart
const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328); // 9.2a
const kBottomContainerColour = Color(0xFFEB1555);

// 17.1a add style for calculate button
const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

// 17.5(a) add style for reults_page title
const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

// 17.7(a)
const kResultsTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

// 17.9(b)
const kBMITextStyle = TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold);

// 17.10(b)
const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
