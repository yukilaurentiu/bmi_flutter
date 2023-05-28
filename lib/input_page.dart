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
                child: ReusableCard(
                    // color : maleColor,
                  onTap: () {
                    setState(() {
                      selectedGender = GenderType.male;
                    });
                  },
                    color: selectedGender == GenderType.male ? basicColor : inactiveColor,
                    cardChild: GenderIcons(
                        icon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
              ),
              Expanded(
                child: ReusableCard(
                  // color: femaleColor,
                  onTap: (){
                    setState(() {
                      selectedGender = GenderType.female;
                    });
                  },
                  color: selectedGender == GenderType.female ? basicColor : inactiveColor,
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
                children: <Widget>[
                  Text('HEIGHT')
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
