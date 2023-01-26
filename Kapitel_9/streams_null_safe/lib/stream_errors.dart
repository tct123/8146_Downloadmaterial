import 'dart:async';

import 'package:flutter/material.dart';

class BloC {
  late StreamController<String> streamController;

  Stream<String> get stream => streamController.stream;

  Sink<String> get sink => streamController.sink;

  void onError() {
    streamController.addError('error');
  }

  void handleError() {
    stream.handleError(
      (error, stacktrace) {
        // Mit error arbeiten
        // ...
      },
      test: (error) => error == 'error',
    );
  }
}

class StreamErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BloC();

    return StreamBuilder<String>(
      stream: bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Fehler aufgetreten ${snapshot.error}');
        }

        return Text('Alles klar!');
      },
    );
  }
}
