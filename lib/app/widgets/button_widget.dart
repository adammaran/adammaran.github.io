import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  Function() onPressed;
  String label;
  Color? color;

  ButtonWidget({required this.onPressed, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
        style: ElevatedButton.styleFrom(backgroundColor: color));
  }
}
