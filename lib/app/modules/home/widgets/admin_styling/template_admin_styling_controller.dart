import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:templater/app/modules/home/controllers/home_controller.dart';
import 'package:templater/app/state/styling_state.dart';

class TemplateAdminStylingController extends GetxController {
  StylingState style = StylingState();

  late TextEditingController fontSizeController;
  late TextEditingController fontColorController;
  late TextEditingController fontFamilyController;
  Rx<FontWeight> fontWeight = FontWeight.normal.obs;

  @override
  void onInit() {
    initTextControllers();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void initTextControllers() {
    fontSizeController =
        TextEditingController(text: style.fontSize.value.toString());
    fontColorController = TextEditingController(text: style.fontColor.value);
    fontFamilyController = TextEditingController(text: style.fontFamily.value);
  }

  void onStyleChange() {
    Get.find<HomeController>().loadingImage.value = true;
    style.fontSize.value = double.parse(fontSizeController.text);
    style.fontColor.value = fontColorController.text;
    // style.fontFamily.value = fontFamilyController.text;
    Get.find<HomeController>().loadingImage.value = false;
  }

  void saveData() {
    ///Should trigger save to db function

    style.fontSize.value = double.parse(fontSizeController.text);
    style.fontColor.value = fontColorController.text;
    style.fontFamily.value = fontFamilyController.text;
  }
}
