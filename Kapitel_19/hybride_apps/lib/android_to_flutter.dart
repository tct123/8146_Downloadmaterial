import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class AndroidToFlutterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewName = 'NativeTextView';

    return PlatformViewLink(
      viewType: viewName,
      surfaceFactory: (context, platformViewController) {
        return AndroidViewSurface(
          controller: platformViewController,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (platformViewCreationParams) {
        return PlatformViewsService.initSurfaceAndroidView(
          id: platformViewCreationParams.id,
          viewType: viewName,
          layoutDirection: TextDirection.ltr,
          creationParams: {},
          creationParamsCodec: StandardMessageCodec(),
        )
          ..addOnPlatformViewCreatedListener(
            platformViewCreationParams.onPlatformViewCreated,
          )
          ..create();
      },
    );
  }
}
