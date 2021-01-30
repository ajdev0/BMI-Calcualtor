import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum Gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 26;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          //first row
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // second column
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  //slider
                  SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: Color(0xFFFFFFFF),
                        inactiveTrackColor: kGrayColor,
                        thumbColor: kBottomNavColor,
                        overlayColor: kOverlayColor,
                        trackHeight: 6),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 250,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // third row
          Expanded(
            child: Row(
              children: <Widget>[
                IncDeriseWidget(
                  number: weight,
                  label: 'WEIGHT',
                  add: () {
                    setState(() {
                      weight++;
                    });
                  },
                  sub: () {
                    setState(() {
                      weight--;
                    });
                  },
                ),
                IncDeriseWidget(
                  number: age,
                  label: 'AGE',
                  add: () {
                    setState(() {
                      age++;
                    });
                  },
                  sub: () {
                    setState(() {
                      age--;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: kBottomNavColor,
            width: double.infinity,
            height: kBottomNavHeight,
          ),
        ],
      ),
    );
  }
}

class IncDeriseWidget extends StatelessWidget {
  IncDeriseWidget({this.number, this.label, this.add, this.sub});

  final int number;
  final String label;
  final Function add;
  final Function sub;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: kLabelTextStyle,
            ),
            Text(
              number.toString(),
              style: kNumberStyle,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: sub,
                    color: kInactiveCardColor,
                    child: Icon(FontAwesomeIcons.minus),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(14),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: add,
                    color: kInactiveCardColor,
                    child: Icon(FontAwesomeIcons.plus),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
