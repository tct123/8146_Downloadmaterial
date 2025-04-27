import 'package:flutter/material.dart';

class AnimatedIconExample extends StatefulWidget {
  @override
  _AnimatedIconExampleState createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward();
        });
      },
      icon: AnimatedIcon(
        progress: _animationController,
        icon: AnimatedIcons.menu_arrow,
        size: 50,
      ),
    );
  }
}

class MultipleTransitionsExample extends StatefulWidget {
  @override
  _MultipleTransitionsExampleState createState() =>
      _MultipleTransitionsExampleState();
}

class _MultipleTransitionsExampleState extends State<MultipleTransitionsExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Tween<double> _tween;
  late Tween<double> _fadeTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);
    // ..addListener(() => setState(() {}));

    _tween = Tween<double>(begin: 100, end: 300);
    _fadeTween = Tween<double>(begin: 0.5, end: 1.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: RotationTransition(
  //       turns: _animationController,
  //       child: FadeTransition(
  //         opacity: _fadeTween.animate(_animationController),
  //         child: Container(
  //           height: _tween.evaluate(_animationController),
  //           width: _tween.evaluate(_animationController),
  //           color: Colors.green,
  //         ),
  //       ),
  //     ),
  //   );
  // }

//Variante mit AnimatedBuilder
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return RotationTransition(
            turns: _animationController,
            child: FadeTransition(
              opacity: _fadeTween.animate(_animationController),
              child: Container(
                height: _tween.evaluate(_animationController),
                width: _tween.evaluate(_animationController),
                color: Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }

  // Variante mit AnimatedWidget
  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: MultipleTransitions(
  //       animationController: _animationController,
  //       fadeTween: _fadeTween,
  //       tween: _tween,
  //     ),
  //   );
  // }
}

class MultipleTransitions extends AnimatedWidget {
  MultipleTransitions({
    required AnimationController animationController,
    required this.fadeTween,
    required this.tween,
  })  : animationController = animationController,
        super(listenable: animationController);

  final AnimationController animationController;
  final Tween<double> fadeTween;
  final Tween<double> tween;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animationController,
      child: FadeTransition(
        opacity: fadeTween.animate(animationController),
        child: Container(
          height: tween.evaluate(animationController),
          width: tween.evaluate(animationController),
          color: Colors.green,
        ),
      ),
    );
  }
}
