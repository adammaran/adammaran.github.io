import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:templater/app/modules/home/widgets/admin_styling/template_admin_styling_widget.dart';
import 'package:templater/app/modules/home/widgets/template_canvas_widget.dart';
import 'package:templater/app/modules/home/widgets/template_input_widget.dart';
import 'package:templater/app/service/company_service.dart';
import 'package:templater/app/widgets/lock_screen.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CompanyService());
    return Obx(
      () => !controller.isUnlocked.value
          ? LockScreen()
          : Scaffold(
              appBar: AppBar(
                title: const Text('Templater'),
                centerTitle: true,
              ),
              body: Container(
                  width: Get.width,
                  height: Get.height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: Get.width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TemplateInputWidget(),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Divider(),
                              ),
                              TemplateAdminStylingWidget()
                            ],
                          )),
                      TemplateCanvasWidget()
                    ],
                  )),
            ),
    );
  }
}
