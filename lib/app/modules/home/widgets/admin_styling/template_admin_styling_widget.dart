import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:templater/app/constants/font.dart';
import 'package:templater/app/service/company_service.dart';
import 'package:templater/app/widgets/button_widget.dart';
import 'package:templater/app/widgets/styling_text_input_widget.dart';
import 'package:templater/app/widgets/text_input_widget.dart';

import 'template_admin_styling_controller.dart';

class TemplateAdminStylingWidget
    extends GetView<TemplateAdminStylingController> {
  @override
  Widget build(BuildContext context) {
    Get.put(TemplateAdminStylingController());

    debugPrint('selValue: ${controller.style.fontFamily.value}');
    debugPrint('selValue: ${FontList.fonts.map((e) => e.name).toList()}');

    return Obx(
      () => Get.find<CompanyService>().loadingStyle.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Obx(
                  () => Text(
                    'Text styling',
                    style: TextStyle(
                        fontSize: 24, fontWeight: controller.fontWeight.value),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Font size:'),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 30,
                          child: StylingTextInputWidget(
                            controller: controller.fontSizeController,
                            onChange: (value) => controller.onStyleChange(),
                          ),
                        ),
                      ],
                    ),
                    DropdownButton<String>(
                        value: controller.style.fontFamily.value,
                        items: FontList.fonts
                            .map((e) => DropdownMenuItem<String>(
                                value: e.name, child: Text(e.name)))
                            .toList(),
                        onChanged: (value) {
                          debugPrint('val $value');
                          controller.style.fontFamily.value = value!;
                          controller.style.fontWeight.value = FontWeight.normal;
                          controller.onStyleChange();
                        }),
                    DropdownButton<String>(
                        value: controller.style.fontWeightToString(
                            controller.style.fontWeight.value),
                        items: FontList.fonts
                            .firstWhere((e) =>
                                e.name == controller.style.fontFamily.value)
                            .weights
                            .map((e) => DropdownMenuItem<String>(
                                value: controller.style.fontWeightToString(e),
                                child: Text(
                                    controller.style.fontWeightToString(e))))
                            .toList(),
                        onChanged: (value) {
                          debugPrint(value);
                          controller.style.fontWeight.value =
                              controller.style.mapStringToFontWeight(value!);
                          debugPrint(
                              controller.style.fontWeight.value.toString());
                          controller.onStyleChange();
                        })
                  ],
                ),
                const SizedBox(height: 24),
                ColorPicker(
                    labelTypes: [],
                    hexInputBar: true,
                    enableAlpha: false,
                    colorPickerWidth: 150,
                    pickerColor:
                        colorFromHex(controller.style.fontColor.value)!,
                    onColorChanged: (pickedColor) {
                      controller.fontColorController.text =
                          colorToHex(pickedColor);
                      controller.onStyleChange();
                    }),
                const SizedBox(height: 24),
                ButtonWidget(onPressed: controller.saveData, label: 'Save')
              ],
            ),
    );
  }
}
