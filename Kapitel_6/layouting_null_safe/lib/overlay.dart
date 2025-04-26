import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OverlayExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final overlay = Overlay.of(context);

      final background = OverlayEntry(
        builder: (context) => ColoredBox(
          color: Colors.grey,
        ),
      );

      overlay.insert(background);

      final overlayEntry = OverlayEntry(
        builder: (context) => Center(
          child: Text(
            'Hallo Overlay',
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      );

      overlay.insert(overlayEntry);
    });

    return Container();
  }
}

class ModalBarrierAlertExample extends StatefulWidget {
  @override
  _ModalBarrierAlertExampleState createState() =>
      _ModalBarrierAlertExampleState();
}

class _ModalBarrierAlertExampleState extends State<ModalBarrierAlertExample> {
  late OverlayEntry _infoBox;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      final overlay = Overlay.of(context);

      _infoBox = OverlayEntry(builder: (context) {
        return InfoBox();
      });

      overlay.insert(_infoBox);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text('Hintergrund ' * 1000),
    );
  }

  @override
  void dispose() {
    _infoBox.remove();

    super.dispose();
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Damit mehrere Effekt übereinander angezeigt werden
    // wird ein Stack benutzt
    return Stack(
      children: [
        ModalBarrier(color: Colors.grey.withOpacity(0.4)),
        // Beispiel ohne Dialog
        // Center(
        //   child: Container(
        //     height: 200,
        //     width: 200,
        //     padding: const EdgeInsets.all(16),
        //     decoration: ShapeDecoration(
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(16),
        //       ),
        //       color: Colors.white,
        //     ),
        //     child: Material(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text('Überschrift'),
        //           const SizedBox(height: 24),
        //           Text('Beschreibung'),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // Beispiel mit Dialog
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Überschrift'),
                const SizedBox(height: 24),
                Text('Beschreibung'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
