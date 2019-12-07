import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // to use one theme and change only some aspects: .copyWith
      theme: ThemeData.dark().copyWith(
        /*
        // 14.4 - slider theme here if you want all sliders to look the same
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 22.5),
          overlayColor: Color(0x33EB1555), // 20% opacity, same pink
          thumbColor: Color(0xFFEB1555), // 100% opacity, same pink
          activeTrackColor: Colors.white, // 14.3
          ),
        */

        // changes here
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
