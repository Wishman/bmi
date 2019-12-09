import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //8.1b
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart'; // 13.2d
import 'results_page.dart'; // 16.4a

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

  int height = 170; // 13.12a 170 is exactly in the middle
  int weight = 60; // 15.2a
  int age = 35; // 15.13a

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
                  SliderTheme(
                    // 14.1
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 22.5),
                      overlayColor: Color(0x33EB1555), // 20% opacity, same pink
                      thumbColor: Color(0xFFEB1555), // 100% opacity, same pink
                      activeTrackColor: Colors.white, // 14.3
                      inactiveTrackColor: Color(0xFF8D8E98), // 14.4 just for consistency here
                    ), //14.2 gives copy of SliderTheme and allows for indiv changes

                    child: Slider(
                      //13.12c
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      //activeColor: Colors.white, //14.3 deactivate for SliderTheme, normally needed!
                      //inactiveColor: Color(0xFF8D8E98), // 14.4 deactivate and moved to SliderTheme (only for
                      // consistency)
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round(); // .round() to cast double to int!!
                        });
                      },
                    ),
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
                    // 15.1a
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        // 15.2b display weight var
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        // 15.3
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // 15.5a
                            //15.6d create RIB with plus icon
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                // 15.10d
                                onTapped: () {
                                  setState(() {
                                    weight++; // alternative to += 1
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              // 15.11
                              onTapped: () {
                                setState(() {
                                  weight--; // alternative to -= 1
                                });
                              },
                            ), //15.9
                            /* old version - See L-123 halfway commit
                            // 15.3a
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            // 15.3b
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ), */
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    // 15.13b
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        // 15.2b display weight var
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        // 15.3
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // 15.5a
                            //15.6d create RIB with plus icon
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                // 15.10d
                                onTapped: () {
                                  setState(() {
                                    age++; // alternative to += 1
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              // 15.11
                              onTapped: () {
                                setState(() {
                                  age--; // alternative to -= 1
                                });
                              },
                            ), //15.9
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // add lower button

          // 16.3 wrap Container in GestureDetector and add route
          GestureDetector(
            // 16.4b ResultsPage is classname not filename!!!!
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage()));
            },
            child: Container(
              child: Text('CALCULATE'), // 16.2
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

// 15.4
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
