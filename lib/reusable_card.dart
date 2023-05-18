import 'package:flutter/material.dart';
import 'input_page.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.color = basicColor, this.cardChild});
  final Color color;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
