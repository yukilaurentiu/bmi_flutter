import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, this.onTap});
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
