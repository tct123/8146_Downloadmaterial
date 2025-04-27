import 'package:flutter/material.dart';

class TweenAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 3),
      tween: Tween(begin: 100.0, end: 300.0),
      curve: Curves.bounceOut,
      builder: (context, value, child) {
        return Container(
          height: value as double,
          width: value,
          color: Colors.blue,
          child: Center(child: child),
        );
      },
      child: Text('In der Mitte'),
    );
  }
}

class CustomTweenableAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<CustomTweenable>(
      tween: Tween<CustomTweenable>(
        begin: CustomTweenable(value: 1.0),
        end: CustomTweenable(value: 5.0),
      ),
      duration: const Duration(seconds: 5),
      builder: (context, tweenable, child) {
        return Text('Value: ${tweenable.value.toStringAsFixed(2)}');
      },
    );
  }
}

class CustomTweenable {
  const CustomTweenable({required this.value});

  final double value;

  static CustomTweenable lerp(
    CustomTweenable a,
    CustomTweenable b,
    double t,
  ) {
    return CustomTweenable(value: a.value + b.value);
  }

  CustomTweenable operator +(CustomTweenable other) {
    return CustomTweenable(value: value + other.value);
  }

  CustomTweenable operator -(CustomTweenable other) {
    return CustomTweenable(value: value - other.value);
  }

  CustomTweenable operator *(double val) {
    return CustomTweenable(value: value * val);
  }
}
