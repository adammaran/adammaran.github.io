import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templater/app/model/company/company_response.dart';
import 'package:templater/app/repository/company_repository.dart';
import 'package:templater/app/state/styling_state.dart';

class CompanyService extends GetxService {
  CompanyRepository companyRepository = CompanyRepository();
  CompanyResponse? company;

  StylingState styleState = StylingState();
  RxBool loadingStyle = RxBool(true);

  @override
  void onInit() async {
    await getCompanyByName('My company');
    super.onInit();
  }

  Future<void> getCompanyByName(String name) async {
    loadingStyle.value = true;
    company = await companyRepository.getCompanyByName(name);
    setStyleData(company!);
  }

  void setStyleData(CompanyResponse res) {
    styleState.fontSize.value = res.styling.fontSize;
    styleState.fontFamily.value = res.styling.fontFamily;
    styleState.fontColor.value = res.styling.fontColor;

    loadingStyle.value = false;
  }
}
