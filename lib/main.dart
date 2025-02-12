import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templater/app/routes/app_pages.dart';
import 'package:templater/app/service/analytics_service.dart';

import 'app/service/company_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  _initServices();
  runApp(const MyApp());
}

_initServices() {
  Get.put(AnalyticsService());
  Get.put(CompanyService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.home,
      title: 'Templater',
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Verdana', // Set Verdana as the global font
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
