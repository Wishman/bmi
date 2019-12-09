import 'package:flutter/material.dart'; // 16.1
import '../constants.dart'; // 17.5 (b)
import '../components/reusable_card.dart'; // 17.6
import 'package:bmi_calculator/components/bottom_button.dart'; // 17.11(g)

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      // 17.4 add widgets to screen
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch, // 17.8
        children: <Widget>[
          // TITLE
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0), // 17.12(a)
              alignment: Alignment.bottomLeft, // 17.12 (b)
              // 17.5(c)
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),

          // RESULT
          // 17.6 add center widgets
          Expanded(
            flex: 5, // flex 5 to take up more space
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Normal',
                    style: kResultsTextStyle, // 17.7b
                  ),
                  // 17.9a
                  Text(
                    '18.3',
                    style: kBMITextStyle, // 19.9(c)
                  ),
                  //17.10a
                  Text(
                    'Your BMI result is quite low, you should eat more!',
                    style: kBodyTextStyle, // 17.10(c)
                    textAlign: TextAlign.center, // 17.10(d)
                  ),
                ],
              ),
            ),
          ),

          // BOTTOM BUTTON
          // 17.11 (h)
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
