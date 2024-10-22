

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:monie_estate/presentation/values/colors.dart';
import 'dart:typed_data' as typed_data;
import 'dart:ui' as ui;

class MapUtils {
  Future<BitmapDescriptor> createCustomMarker({
    required String text,
    required bool isShowIconOnly,
  }) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    double width = isShowIconOnly ? 90 : 170;
    const double height = 100;

    final Paint paint = Paint()..color = AppColors.pry;
    final Path path = Path()
      ..moveTo(0, 20)
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, 20)
      ..arcToPoint(Offset(width - 20, 0),
          radius: const Radius.circular(20), clockwise: false)
      ..lineTo(20, 0)
      ..arcToPoint(const Offset(0, 20),
          radius: const Radius.circular(20), clockwise: false)
      ..close();

    canvas.drawPath(path, paint);

    double offsetX = 20.0;
    const double iconSize = 50.0;

    if (isShowIconOnly) {
      const icon = Icons.account_balance_rounded;
      final textPainterIcon = TextPainter(
        textDirection: TextDirection.ltr,
      );
      textPainterIcon.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontFamily: icon.fontFamily,
          fontSize: iconSize,
          color: Colors.white,
        ),
      );
      textPainterIcon.layout();
      textPainterIcon.paint(canvas, Offset(offsetX, 20.0));

      offsetX += iconSize + 10.0;
    } else {

      final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
      );

      textPainter.text = TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 30.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(offsetX, 30.0));
    }

    final ui.Image img = await pictureRecorder
        .endRecording()
        .toImage(width.toInt(), height.toInt());

    final typed_data.ByteData? byteData =
    await img.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) {
      throw Exception('Error converting image to byte data');
    }

    final typed_data.Uint8List pngBytes = byteData.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(pngBytes);
  }

  List<Map<String, dynamic>> propertiesData = [
    {"id": "1", "price": "\$23,000", "lat": 37.7749, "lng": -122.4194},
    {"id": "2", "price": "\$17,000", "lat": 37.7849, "lng": -122.4294},
    {"id": "3", "price": "\$15,500", "lat": 37.7760, "lng": -122.4155},
    {"id": "4", "price": "\$13,000", "lat": 37.7811, "lng": -122.4210},
  ];

}