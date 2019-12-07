import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //8.1b
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart'; // 13.2d

enum Gender { male, female } // 10.1 add enum for gender

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // 9.2b - init with starting value inactive
  //Color maleCardColour = inactiveCardColour;  // no longer needed as per 11
  //Color femaleCardColour = inactiveCardColour;  // no longer needed as per 11
  Gender selectedGender; // 11.1 create selected Gender Enum

  int height = 180; // 13.12a

  /* no longer needed as of Step 10
  // 9.2c - 1 = male, 2 = female, change color to other state
  void updateColour(Gender selectedGender) {
    // 10.2a replace int Gender with enum
    if (selectedGender == Gender.male) {
      // 10.2b check for male with enum
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour; // 9.2f
      } else {
        maleCardColour = inactiveCardColour;
      }
    } else if (selectedGender == Gender.female) {
      // 10.2c check for female with enum
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour; // 9.2f
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // 13.5
        children: <Widget>[
          // first row - two containers
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  // 9.1
                  child: ReusableCard(
                    //12.3 assign anon func with setState to onPress Func Prop
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    //colour: maleCardColour, // 9.2c
                    // 11.3a set active color for male if selected
                    colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                    // 8.2 add cardChild
                    cardChild: new IconContent(
                      // 8.4
                      cardIcon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  // 9.1
                  child: ReusableCard(
                    //12.3 as above but for females
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    // colour: femaleCardColour, // 9.2c
                    //11.3b  set active colour if selected
                    colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(
                      // 8.4
                      cardIcon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),

          // second "row" - 1 container
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              // 13.1
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 13.9 vertical centering
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 13.10 horizontal centering
                    crossAxisAlignment: CrossAxisAlignment.baseline, //13.11a get cm in proper place
                    textBaseline: TextBaseline.alphabetic, //13.11b needed for CrossAxisAlignment.baseline to work
                    // 13.6
                    children: <Widget>[
                      Text(
                        height.toString(), // 13.12b
                        style: kNumberTextStyle, // 13.7
                      ),
                      Text(
                        // 13.8
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    //13.12c
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round(); // .round() to cast double to int!!
                      });
                    },
                  ), // 13.12 add slider
                ],
              ),
            ),
          ),

          // third row - two containers
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                  ),
                )
              ],
            ),
          ),
          // add lower button
          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
