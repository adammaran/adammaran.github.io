import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:templater/app/routes/app_pages.dart';
import 'package:templater/app/service/company_service.dart';

class AuthController extends GetxController {
  late CompanyService companyService;

  TextEditingController companyName = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void login() async {
    companyService = Get.put(CompanyService());

    try {
      await companyService.getCompanyByName(companyName.text);

      Get.toNamed(AppPages.home);
    } catch (e) {
      if (e.toString() == 'Bad state: No element') {
        Get.snackbar('Error', 'Company not found');
      }
      debugPrint(e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
