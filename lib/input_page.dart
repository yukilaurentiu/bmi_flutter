import 'package:bmi_flutter/result_page.dart';
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
  int weight = 60;
  int age = 25;

  // void updateColor(GenderType gender){
  //   gender == GenderType.male ? maleColor = basicColor : maleColor = inactiveColor;
  //   gender == GenderType.female ? femaleColor = basicColor : femaleColor = inactiveColor;
  // }

  // GenderType gender = GenderType.none;
  // void updateColor(GenderType g) {F
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
                  SliderTheme(
                    data: const SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: pinkColor,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
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
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'WEIGHT',
                        style: labelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: cardTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                          const SizedBox(width: 10.0),
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        color: basicColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'AGE',
                              style: labelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: cardTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onTap: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                const SizedBox(width: 10.0),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onTap: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ResultPage();
                  },
                ),
              );
            },
            child: Container(
              color: pinkColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(child: const Text('CALCULATE', style: largeButtonTextStyle,)),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onTap});
  final IconData? icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onTap,
      child: Icon(icon),
    );
  }
}
