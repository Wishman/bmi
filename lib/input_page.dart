import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //8.1b
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328); // 9.2a
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // 9.2b - init with starting value inactive
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  // 9.2c - 1 = male, 2 = female, change color to other state
  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour; // 9.2f
      } else {
        maleCardColour = inactiveCardColour;
      }
    } else {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour; // 9.2f
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(1); // 9.2e
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour, // 9.2c
                      // 8.2 add cardChild
                      cardChild: new IconContent(
                        // 8.4
                        cardIcon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  // 9.1
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(2); // 9.2e
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour, // 9.2c
                      cardChild: IconContent(
                        // 8.4
                        cardIcon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
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
