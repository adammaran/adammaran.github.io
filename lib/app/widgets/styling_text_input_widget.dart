import 'package:flutter/material.dart';

class StylingTextInputWidget extends StatelessWidget {
  TextEditingController controller;
  Function(String) onChange;

  StylingTextInputWidget({required this.controller, required this.onChange});

  @override
  Widget build(BuildContext context) => TextFormField(controller: controller, onChanged: onChange,);
}
