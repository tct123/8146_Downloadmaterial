import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: BoxDecorationExample())));
}

class BoxDecorationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Kreis mit Border
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.green),
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 8),

          // Rechteck mit borderRadius
          // borderRadius wird ignoriert, wenn shape nicht BoxShape.rectangle ist
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.green),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(50),
              ),
              color: Colors.red,
            ),
          ),

          const SizedBox(height: 8),

          // DecoratedBox, wird intern von Container benutzt
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                child: SizedBox(height: 100, width: 100),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.red, Colors.green, Colors.blue],
                  ),
                ),
              ),
              SizedBox(width: 8),
              DecoratedBox(
                child: SizedBox(height: 100, width: 100),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    // begin: Alignment.centerLeft,
                    // end: Alignment.centerRight,
                    colors: [Colors.red, Colors.green, Colors.blue],
                  ),
                ),
              ),
              SizedBox(width: 8),
              DecoratedBox(
                child: SizedBox(height: 100, width: 100),
                decoration: BoxDecoration(
                  gradient: SweepGradient(
                    colors: [Colors.red, Colors.green, Colors.blue],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Shadow
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(5, 5),
                  blurRadius: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClippingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Aus:'),
              SizedBox(width: 8),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
              SizedBox(width: 8),
              Text('wird:'),
              SizedBox(width: 8),
              ClipPath(
                clipper: _MyCustomPathClipper(),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          ClipRect(
            clipper: _MyCustomClipper(),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  height: 100,
                  width: 150,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 8),
              ClipOval(
                child: Container(
                  height: 150,
                  width: 100,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 8),
              ClipOval(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MyCustomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromCircle(
    center: Offset(20, 20),
    radius: 20,
  );

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => true;
}

class _MyCustomPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(20, 20, 80, 80),
        Radius.circular(100),
      ),
    )
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class ThemeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Ein Text',
        style: TextStyle(
          color: Colors.blue,
          backgroundColor: Colors.grey,
          fontSize: 64,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.lineThrough,
        ),
      ),
    );
  }
}

class RichTextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'Links',
              children: [
                TextSpan(text: 'Mitte', style: TextStyle(fontSize: 24)),
                TextSpan(text: 'Rechts', style: TextStyle(fontSize: 36)),
              ],
              style: DefaultTextStyle.of(context).style,
            ),
          ),
        ],
      ),
    );
  }
}

class DefaultTextStyleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.blue,
          backgroundColor: Colors.grey,
          fontSize: 64,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.lineThrough,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1. Text'),
            SizedBox(height: 8),
            Text('2. Text')
          ],
        ),
      ),
    );
  }
}

class RotationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Das rotiert!',
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}

class OpacityExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.2,
        child: Container(
          height: 100,
          width: 100,
          color: Colors.green,
        ),
      ),
    );
  }
}

class TransformExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform(
            transform: Matrix4.rotationZ(pi / 4),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 8),
          Transform.rotate(
            angle: pi / 4,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class BackdropFilterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Text('Blurry', style: TextStyle(fontSize: 64)),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}