import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class LabelPainter {
  Future<ByteData> getImageByteData() async {
    int width = 60;
    int height = 60;
    ui.PictureRecorder recorder = ui.PictureRecorder();

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    Canvas c = Canvas(recorder);
    c.drawRRect(RRect.fromLTRBAndCorners(20, 30, 40, 50), paint);
    paint.color = Colors.red;
    c.drawRect(const Rect.fromLTWH(10, 10, 10, 10), paint);
    paint.color = Colors.blue;
    c.drawRect(
        Rect.fromCenter(center: const Offset(50, 50), height: 50, width: 50),
        paint);
    paint.color = Colors.black;
    c.drawRect(
        Rect.fromPoints(
            const Offset(0, 0), Offset(width.toDouble(), height.toDouble())),
        paint);
    // c.drawPaint(Paint()); // etc
    ui.Picture p = recorder.endRecording();
    ui.Image uiImg = await p.toImage(
        width, height); //.toByteData(format: ImageByteFormat.png);

    ByteData? byteData = await uiImg.toByteData(format: ui.ImageByteFormat.png);
    return byteData!;
  }
}
