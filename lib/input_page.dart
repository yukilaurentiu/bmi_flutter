import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum GenderType { male, female, none }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleColor = inactiveColor;
  // Color femaleColor = inactiveColor;

  GenderType? selectedGender;
  int height = 180;

  // void updateColor(GenderType gender){
  //   gender == GenderType.male ? maleColor = basicColor : maleColor = inactiveColor;
  //   gender == GenderType.female ? femaleColor = basicColor : femaleColor = inactiveColor;
  // }

  // GenderType gender = GenderType.none;
  // void updateColor(GenderType g) {
  //   if (g == gender) {
  //     gender = GenderType.none;
  //     maleColor = inactiveColor;
  //     femaleColor = inactiveColor;
  //   } else {
  //     gender = g;
  //     gender == GenderType.male ? maleColor = basicColor : maleColor = inactiveColor;
  //     gender == GenderType.female ? femaleColor = basicColor : femaleColor = inactiveColor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  // color : maleColor,
                  onTap: () {
                    setState(() {
                      selectedGender = GenderType.male;
                    });
                  },
                  color: selectedGender == GenderType.male
                      ? basicColor
                      : inactiveColor,
                  cardChild:
                      GenderIcons(icon: FontAwesomeIcons.mars, label: 'MALE'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  // color: femaleColor,
                  onTap: () {
                    setState(() {
                      selectedGender = GenderType.female;
                    });
                  },
                  color: selectedGender == GenderType.female
                      ? basicColor
                      : inactiveColor,
                  cardChild: GenderIcons(
                      icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  // function: cardAction(selectedGender = GenderType.female)
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              color: basicColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: cardTextStyle),
                      const Text('cm', style: labelTextStyle),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: footerColor,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: basicColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: basicColor,
                ),
              ),
            ],
          )),
          Container(
            // child: Text('hello'),
            color: footerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
