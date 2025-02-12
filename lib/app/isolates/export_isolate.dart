import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void exportToImage(SendPort sendPort, GlobalKey canvasKey) async {
  // try {
  RenderRepaintBoundary boundary =
      canvasKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

  // Convert the canvas to an image
  final image = await boundary.toImage(pixelRatio: 3.0);
  final byteData = await image.toByteData(format: ImageByteFormat.png);
  final Uint8List pngBytes = byteData!.buffer.asUint8List();

  sendPort.send(pngBytes);
}
