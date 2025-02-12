import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:templater/app/modules/home/controllers/home_controller.dart';
import 'package:templater/app/widgets/text_input_widget.dart';

class LockScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: Get.height,
            width: Get.width,
            color: colorFromHex('#33383e'),
            child: Center(
                child: Container(
                    height: Get.height * 0.08,
                    width: Get.width * 0.3,
                    child: Material(
                        borderRadius: BorderRadius.circular(16),
                        color: colorFromHex('#7AE300'),
                        child: TextInputWidget(
                          maxLines: 1,
                          controller.passcodeController,
                          'Passcode',
                          trailing: IconButton(
                              onPressed: () {
                                controller.unlockApp();
                              },
                              icon: const Icon(Icons.keyboard_arrow_right)),
                          onSubmitted: (value) {
                            controller.unlockApp();
                          },
                        )))),
          ),
        ],
      );
}
