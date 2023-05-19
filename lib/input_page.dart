import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const basicColor = Color(0xFF1D1F33);
const inactiveColor = Color(0xFF111328);
const footerColor = Color(0xFFEB1555);
enum GenderType {male, female, none}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleColor = inactiveColor;
  // Color femaleColor = inactiveColor;

  GenderType ? selectedGender;

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
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // updateColor(GenderType.male);
                      selectedGender = GenderType.male;
                    });
                  },
                  child: ReusableCard(
                    // color : maleColor,
                     color: selectedGender == GenderType.male ? basicColor : inactiveColor,
                    cardChild:
                        GenderIcons(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // updateColor(GenderType.female);
                       selectedGender = GenderType.female;
                    });
                  },
                  child: ReusableCard(
                    // color: femaleColor,
                    color: selectedGender == GenderType.female ?  basicColor : inactiveColor,
                    cardChild: GenderIcons(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              color: basicColor,
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
