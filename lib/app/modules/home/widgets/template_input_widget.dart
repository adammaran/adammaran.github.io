import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:templater/app/constants/language.dart';
import 'package:templater/app/modules/home/controllers/home_controller.dart';
import 'package:templater/app/widgets/button_widget.dart';
import 'package:templater/app/widgets/text_input_widget.dart';

class TemplateInputWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                color: colorFromHex('#33383e'),
                child: Column(
                  children: [
                    TextInputWidget(controller.firstController, 'First text',
                        onChange: (value) {
                      controller.onTextInputChange(value,
                          controller.firstController, controller.firstText);
                    }),
                    const SizedBox(height: 8),
                    TextInputWidget(controller.secondController, 'Second text',
                        onChange: (value) {
                      controller.onTextInputChange(value,
                          controller.secondController, controller.secondText);
                    }),
                    const SizedBox(height: 8),
                    TextInputWidget(controller.thirdController, 'Third text',
                        onChange: (value) {
                      controller.onTextInputChange(value,
                          controller.thirdController, controller.thirdText);
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(width: 40),
            Flexible(child: _buildSelectedLanguages())
          ],
        ),
        const SizedBox(height: 24),
        Column(
          children: [
            ButtonWidget(
                onPressed: showLanguageSelectDialog, label: 'Select languages'),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  controller.startExport();
                },
                child: const Text('Export')),
          ],
        )
      ],
    );
  }

  Widget _buildSelectedLanguages() => SizedBox(
        width: 300,
        child: Column(
          children: [
            const Text(
              'Additional languages:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Obx(
              () => SizedBox(
                height: Get.height * 0.2,
                child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: controller
                        .styleService.styleState.selectedLanguages.length,
                    itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            '${index + 1}. ${controller.styleService.styleState.selectedLanguages.elementAt(index).name}',
                            textAlign: TextAlign.start,
                          ),
                        )),
              ),
            ),
          ],
        ),
      );

  void showLanguageSelectDialog() {
    Get.dialog(
        Dialog(
          child: Container(
            height: Get.height * 0.6,
            width: Get.width * 0.3,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: LanguageConstants.supportedLanguages.length,
                      itemBuilder: (_, index) {
                        Lng lng = LanguageConstants.supportedLanguages
                            .elementAt(index);
                        return Material(
                          child: Obx(
                            () => CheckboxListTile(
                                title: Text(lng.name),
                                value: controller
                                    .styleService.styleState.selectedLanguages
                                    .contains(lng),
                                onChanged: (isSelected) {
                                  if (isSelected ?? false) {
                                    controller.styleService.styleState
                                        .selectedLanguages
                                        .add(lng);
                                  } else {
                                    controller.styleService.styleState
                                        .selectedLanguages
                                        .remove(lng);
                                  }
                                  debugPrint(controller
                                      .styleService.styleState.selectedLanguages
                                      .toString());
                                }),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget(
                        onPressed: controller.cancelLanguageSelect,
                        label: "Cancel"),
                    ButtonWidget(
                        onPressed: controller.clearLanguages, label: "Clear"),
                    ButtonWidget(
                        onPressed: controller.selectLanguages, label: "Select"),
                  ],
                )
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
