import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TextInputWidget extends StatelessWidget {
  TextEditingController controller;
  String hint;
  Function(String)? onChange;
  Function(String)? onSubmitted;
  int? maxLines;
  IconButton? trailing;

  TextInputWidget(this.controller, this.hint,
      {this.onChange, this.onSubmitted, this.maxLines, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: colorFromHex('#7AE300'),
          borderRadius: BorderRadius.circular(16)),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hint, border: InputBorder.none, suffixIcon: trailing),
          onChanged: onChange,
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: maxLines ?? 3,
          onSubmitted: onSubmitted),
    );
  }
}
