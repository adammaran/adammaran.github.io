import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'dart:ui' as ui;
import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:templater/app/constants/language.dart';
import 'package:templater/app/repository/auth_repository.dart';
import 'package:templater/app/service/company_service.dart';
import 'package:translator/translator.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../../service/analytics_service.dart';

class HomeController extends GetxController {
  RxList<Offset> points = RxList.empty();

  CompanyService styleService = Get.find<CompanyService>();

  AuthRepository authRepository = AuthRepository();
  TextEditingController passcodeController = TextEditingController();
  RxBool isAuthenticating = RxBool(false);
  RxBool isUnlocked = RxBool(false);

  RxBool loadingImage = RxBool(true);

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();

  RxString firstText = RxString('');
  RxString secondText = RxString('');
  RxString thirdText = RxString('');

  RxDouble exportingProgress = RxDouble(-1);

  ui.Image? bgImage;

  GlobalKey repaintBoundaryKey = GlobalKey();

  RxList<String> progressList = RxList.empty();

  @override
  void onInit() async {
    loadImage('background.png').then((value) {
      loadingImage.value = false;
      bgImage = value;
    });

    if(kDebugMode){
      isUnlocked.value = true;
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void showProgressDialog() {
    Get.dialog(Dialog(
        child: Container(
      height: Get.height * 0.4,
      width: Get.width * 0.4,
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 36),
            LinearProgressIndicator(
              value: exportingProgress.value,
            ),
            Flexible(
              child: Obx(() => ListView.builder(
                  itemCount: progressList.length,
                  itemBuilder: (_, index) =>
                      Text(progressList.elementAt(index)))),
            )
          ],
        ),
      ),
    )));
  }

  void startExport() async {
    if (styleService.styleState.selectedLanguages.isEmpty) {
      exportToImage(isSingleImage: true);
      return;
    }

    progressList.add('Starting export...');

    exportingProgress.value =
        1 / styleService.styleState.selectedLanguages.length;
    showProgressDialog();

    List<Uint8List> exportedImages = [];

    exportedImages.add((await exportToImage())!);

    for (Lng lng in styleService.styleState.selectedLanguages) {
      progressList.add('Translating to ${lng.name}...');
      List<String> translation = await getTranslatedStrings(
          [firstController.text, secondController.text, thirdController.text],
          lng.code);

      if (translation.isEmpty) {
        Get.find<AnalyticsService>().logEvent(
            event: 'translation-error', data: {'missing-language': lng.name});
        continue;
      }

      ///change this to me dynamic
      firstText.value = translation[0];
      secondText.value = translation[1];
      thirdText.value = translation[2];

      await Future.delayed(const Duration(milliseconds: 500));

      progressList.add('Exporing ${lng.name}...');

      exportedImages.add((await exportToImage())!);

      exportingProgress.value +=
          1 / styleService.styleState.selectedLanguages.length;
    }

    _downloadZip(exportedImages);
  }

  void _downloadZip(List<Uint8List> images) {
    final archive = Archive();

    for (int i = 0; i < images.length; i++) {
      String language = 'English';
      if (i != 0) {
        language = styleService.styleState.selectedLanguages[i - 1].name;
      }
      Get.find<AnalyticsService>()
          .logEvent(event: 'language', data: {'language': language});
      archive.addFile(
          ArchiveFile('${i + 1}_$language.png', images[i].length, images[i]));
    }

    Get.find<AnalyticsService>().logEvent(event: 'Export', data: {
      'export-count': images.length,
    });

    final zipData = ZipEncoder().encode(archive);
    final blob = html.Blob([zipData]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'images.zip')
      ..click();

    html.Url.revokeObjectUrl(url);
    Get.back();
  }

  Future<List<String>> getTranslatedStrings(
      List<String> inputText, String languageCode) async {
    try {
      List<String> translatedText = [];
      final translator = GoogleTranslator();

      for (String text in inputText) {
        String translation =
            (await translator.translate(text, from: 'en', to: languageCode))
                .text;
        translatedText.add(translation);
      }

      return translatedText;
    } catch (e) {
      debugPrint('getTranslatedStrings() error: $e');
      return [];
    }
  }

  Future<Uint8List?> exportToImage({bool isSingleImage = false}) async {
    // try {
    RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    // Convert the canvas to an image
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    if (!isSingleImage) {
      return pngBytes;
    }

    // Trigger download in the browser
    final blob = html.Blob([pngBytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = 'original.png'
      ..click();
    html.Url.revokeObjectUrl(url);

    debugPrint('dodje do ovde?');

    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text("Image generated and ready for download")),
    );
    // } catch (e) {
    //   print("Error exporting image: $e");
    //   ScaffoldMessenger.of(Get.context!).showSnackBar(
    //     SnackBar(content: Text("Failed to generate image")),
    //   );
    // }

    return null;
  }

  Future<ui.Image> loadImage(String imageAssetPath) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  void onTextInputChange(
      String value, TextEditingController controller, RxString text) {
    if (value.split('\n').length > 3) {
      controller.text = value.split('\n').take(3).join("\n");
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    } else {
      text.value = value;
    }
  }

  void cancelLanguageSelect() {
    styleService.styleState.selectedLanguages.clear();
    Get.back();
  }

  void clearLanguages() {
    styleService.styleState.selectedLanguages.clear();
  }

  void selectLanguages() {
    Get.back();
  }

  double getCanvasHeight() {
    return Get.height * 0.7;
  }

  double getCanvasWidth() {
    return Get.height * 0.5;
  }

  void unlockApp() async {
    isAuthenticating.value = true;
    String authRes =
        await authRepository.checkPasscode(passcodeController.text);
    if (authRes == 'success') {
      isUnlocked.value = true;
    } else {
      Get.snackbar('Error', authRes);
    }

    debugPrint('authRes: $authRes');
    isAuthenticating.value = false;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
