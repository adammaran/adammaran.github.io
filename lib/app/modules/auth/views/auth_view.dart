import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:templater/app/widgets/button_widget.dart';
import 'package:templater/app/widgets/text_input_widget.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AuthView'),
          centerTitle: true,
        ),
        body: Center(child: _buildBody()));
  }

  Container _buildBody() => Container(
        width: Get.width * 0.4,
        child: Column(
          children: [
            TextInputWidget(controller.companyName, 'Company Name'),
            TextInputWidget(controller.username, 'Username'),
            ButtonWidget(onPressed: controller.login, label: 'Enter')
          ],
        ),
      );
}
