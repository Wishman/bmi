import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //8.1b
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  child: ReusableCard(
                    colour: activeCardColour,
                    // 8.2 add cardChild
                    cardChild: new IconContent(
                      // 8.4
                      cardIcon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
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
