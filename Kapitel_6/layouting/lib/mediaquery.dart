import 'package:flutter/material.dart';

class MediaQueryExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final windowHeight = mediaQueryData.size.height;
    final windowWidth = mediaQueryData.size.width;

    final window = WidgetsBinding.instance.window;
    final fromWindow = MediaQueryData.fromWindow(window);
    final isDarkMode = fromWindow.platformBrightness == Brightness.dark;

    final isPortrait = fromWindow.orientation == Orientation.portrait;

    return Stack(
      children: [
        Positioned.fromRect(
          rect: Rect.fromLTWH(
            0,
            0,
            windowWidth,
            mediaQueryData.viewPadding.top,
          ),
          child: ColoredBox(color: Colors.green, child: SizedBox.expand()),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'viewInsets: ${mediaQueryData.viewInsets.bottom.toStringAsFixed(2)}'),
            TextField(),
          ],
        )),
        Positioned.fromRect(
          rect: Rect.fromLTWH(
            0,
            mediaQueryData.size.height - mediaQueryData.viewPadding.bottom,
            windowWidth,
            mediaQueryData.viewPadding.bottom,
          ),
          child: ColoredBox(color: Colors.green, child: SizedBox.expand()),
        ),
      ],
    );
  }

  void checkDeviceSize(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    if (shortestSide < 600) {
      // Smartphone
    } else if (shortestSide >= 600 && shortestSide < 720) {
      // 7 Zoll Tablet
    } else {
      // 10+ Zoll Tablet
    }
  }
}

class CustomMediaQueryExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: false,
      removeLeft: false,
      removeRight: false,
      child: SafeArea(child: Text('Hallo, Welt!')),
    );
  }
}
