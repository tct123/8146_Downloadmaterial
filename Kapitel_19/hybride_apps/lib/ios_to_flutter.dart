import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class IOSToFlutterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewName = 'NativeTextView';

    return UiKitView(
      viewType: viewName,
      layoutDirection: TextDirection.ltr,
      creationParams: {},
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
