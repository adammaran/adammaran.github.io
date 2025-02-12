import 'dart:ui' as ui show Image;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:templater/app/modules/home/controllers/home_controller.dart';
import 'package:templater/app/service/company_service.dart';
import 'package:templater/app/state/styling_state.dart';
import 'package:templater/app/tools/hrom_hex.dart';

class TemplateCanvasWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double canvasWidth = controller.getCanvasWidth();
    double canvasHeight = controller.getCanvasHeight();

    return Obx(
      () => controller.loadingImage.value
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Image preview',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: canvasHeight,
                    width: canvasWidth,
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.black)),
                    child: RepaintBoundary(
                      key: controller.repaintBoundaryKey,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          controller.points.add(details.localPosition);
                        },
                        onPanEnd: (details) {
                          controller.points.add(Offset.zero);
                        },
                        child: Obx(
                          () => CustomPaint(
                            painter: TemplatePainter(
                                controller.firstText.value,
                                controller.secondText.value,
                                controller.thirdText.value,
                                controller.bgImage,
                                controller.points.value),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class TemplatePainter extends CustomPainter {
  StylingState style = StylingState();

  String firstText;
  String secondText;
  String thirdText;

  List<Offset> points;

  ui.Image? image;

  TemplatePainter(
      this.firstText, this.secondText, this.thirdText, this.image, this.points);

  @override
  void paint(Canvas canvas, Size size) {
    ///BACKGROUND PAINT
    final srcRect =
        Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble());
    final dstRect = Rect.fromLTWH(0, 0, size.width, size.height);

    if (image != null) {
      canvas.drawImageRect(image!, srcRect, dstRect, Paint());
    }

    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }

    ///TEXT PAINT
    double firstElementHeight = size.height * 0.175 -
        getTextPositionByNewLines(newLinesCount(firstText));
    double secondElementHeight =
        size.height / 2 - getTextPositionByNewLines(newLinesCount(secondText));
    double thirdElementHeight = size.height * 0.825 -
        getTextPositionByNewLines(newLinesCount(thirdText));

    drawText(canvas, size, firstText, firstElementHeight);
    drawText(canvas, size, secondText, secondElementHeight);
    drawText(canvas, size, thirdText, thirdElementHeight);
  }

  RRect drawRRect(Size size, double heightPosition) {
    final rect =
        Rect.fromLTWH(20, heightPosition, size.width - 40, size.height * 0.24);
    return RRect.fromRectAndRadius(rect, const Radius.circular(18));
  }

  int newLinesCount(String text) {
    int count = 0;

    for (int i = 0; i < text.length; i++) {
      if (text[i] == '\n') {
        count++;
      }
    }

    return count;
  }

  double getTextPositionByNewLines(int newLines) {
    switch (newLines) {
      case 0:
        return style.fontSize.value / 2;
      case 1:
        return style.fontSize.value + style.fontSize.value / 2;
      case 2:
        return style.fontSize.value * 2;
      default:
        return 0;
    }
  }

  void drawText(Canvas canvas, Size size, String text, double position) {
    TextStyle textStyle = TextStyle(
      color: HexColor.fromHex(style.fontColor.value),
      decoration: TextDecoration.underline,
      fontWeight: style.fontWeight.value,
      fontFamily: style.fontFamily.value,
      fontSize: style.fontSize.value,
    );

    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final TextPainter textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final offset = Offset(
      80,
      position,
    );

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
