import 'package:bmi_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            child: const Text('Your Result', style: titleStyle),
          ),),
          Expanded(flex: 5,child: ReusableCard(
            color: basicColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Normal', style: resultTextStyle),
                Text(
                  '18.3', style:  bmiTextStyle,
                ),
                Text('Your result', style:bodyTextStyle, textAlign: TextAlign.center, ),

              ],
            ),
          ),)
        ],
      ),
    );
  }
}
