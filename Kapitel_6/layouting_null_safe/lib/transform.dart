import 'package:flutter/material.dart';

class TransformExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        transform: Matrix4.rotationZ(50),
        child: Container(
          height: 200,
          width: 200,
          color: Colors.green,
        ),
      ),
    );
  }
}
