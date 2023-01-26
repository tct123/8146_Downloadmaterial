import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: TextBubble())),
    );
  }
}

class TextBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TextBubblePainter(),
      // Sprechblase
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Hallo!', style: TextStyle(fontSize: 26)),
      ),
    );
  }
}

class TextBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final left = 0.0;
    final top = 0.0;
    final right = size.width;
    final bottom = size.height;
    final radius = Radius.circular(8);

    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromLTRBR(left, top, right, bottom, radius),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}

class RoboterExample extends StatelessWidget {
  const RoboterExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RoboterPainter(),
    );
  }
}

class RoboterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromLTRBR(0, 0, 100, 70, Radius.circular(8)),
      paint,
    );

    canvas.drawOval(
        Rect.fromLTWH(20, 20, 20, 20), paint..color = Colors.yellow);
    canvas.drawOval(
        Rect.fromLTWH(60, 20, 20, 20), paint..color = Colors.yellow);

    canvas.drawCircle(Offset(50, 170), 100, paint..color = Colors.grey);

    canvas.drawLine(
      Offset(-20, 290),
      Offset(40, 290),
      paint
        ..color = Colors.red
        ..style = PaintingStyle.stroke
        ..strokeWidth = 30.0,
    );

    canvas.drawLine(Offset(60, 290), Offset(120, 290), paint);

    canvas.drawPath(Path()..addPolygon([
      Offset(120, 80),
      Offset(185, 180),
    ], false), paint..strokeCap = StrokeCap.round);

    canvas.drawPoints(ui.PointMode.polygon, [
      Offset(-20, 80),
      Offset(-65, 180),
    ], paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}

class TextExample extends StatelessWidget {
  const TextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DrawTextPainter(),
    );
  }
}

class DrawTextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final left = 0.0;
    final top = 0.0;
    final right = 200.00;
    final bottom = 200.0;
    final radius = Radius.circular(8);

    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromLTRBR(left, top, right, bottom, radius),
      paint,
    );

    final textStyle = ui.TextStyle(color: Colors.black);
    final paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(fontSize: 24),
    )
      ..pushStyle(textStyle)
      ..addText('Hallo');

    final paragraph = paragraphBuilder.build()
      ..layout(ui.ParagraphConstraints(width: 200.0));

    canvas.drawParagraph(paragraph, Offset(20, 20));

    final textPainter = TextPainter(
      text: TextSpan(
        text: 'Welt!',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(canvas, Offset(80, 20));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}