import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //8.1b
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328); // 9.2a
const bottomContainerColour = Color(0xFFEB1555);

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
                    colour: selectedGender == Gender.male ? activeCardColour : inactiveCardColour,
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
                    colour: selectedGender == Gender.female ? activeCardColour : inactiveCardColour,
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

          // second "row" - 1 container - therefore no Row()
          Expanded(
            child: ReusableCard(
              colour: activeCardColour,
            ),
          ),

          // third row - two containers
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                  ),
                )
              ],
            ),
          ),
          // add lower button
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
