import 'package:flutter/material.dart';

class SizeAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: Future.delayed(Duration(seconds: 1)),
      builder: (context, snapshot) {
        final hasEnded = snapshot.connectionState == ConnectionState.done;

        return AnimatedContainer(
          color: Colors.green,
          height: hasEnded ? 300 : 100,
          width: hasEnded ? 300 : 100,
          duration: Duration(seconds: 2),
        );
      },
    );
  }
}

class ColorAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, snapshot) {
        final hasEnded = snapshot.connectionState == ConnectionState.done;

        return AnimatedContainer(
          color: hasEnded ? Colors.green : Colors.red,
          height: hasEnded ? 300 : 100,
          width: hasEnded ? 300 : 100,
          duration: Duration(seconds: 2),
        );
      },
    );
  }
}

class OpacityAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: 500)),
      builder: (context, snapshot) {
        return AnimatedOpacity(
          opacity: snapshot.connectionState == ConnectionState.done ? 1.0 : 0.0,
          duration: Duration(milliseconds: 1500),
          curve: Curves.bounceIn,
          child: Text('Überraschung!'),
        );
      },
    );
  }
}

class AnimatedCrossFadeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 4)),
      builder: (context, snapshot) {
        return AnimatedCrossFade(
          firstChild: Center(child: CircularProgressIndicator()),
          secondChild: Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
          crossFadeState: snapshot.connectionState != ConnectionState.done
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 400),
        );
      },
    );
  }
}

class AnimatedSizeExample extends StatefulWidget {
  @override
  _AnimatedSizeExampleState createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          final hasEnded = snapshot.connectionState == ConnectionState.done;

          return AnimatedSize(
            duration: const Duration(milliseconds: 400),
            child: Container(
              color: Colors.green,
              height: hasEnded ? 300 : 100,
              width: hasEnded ? 300 : 100,
            ),
          );
        });
  }
}

class RouteA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'HeroTag',
          placeholderBuilder: (context, heroSize, child) {
            return Placeholder(
              fallbackHeight: heroSize.height,
              fallbackWidth: heroSize.width,
            );
          },
          child: RawMaterialButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RouteB(),
                ),
              );
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

class RouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomRight,
        child: Hero(
          tag: 'HeroTag',
          child: Container(
            height: 100,
            width: 300,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
