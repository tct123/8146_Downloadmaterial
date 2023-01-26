import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: DraggableExample())));
}

class DismissableExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Über dem Dismissable'),
          Dismissible(
            key: UniqueKey(),
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.green,
            ),
            background: ColoredBox(color: Colors.red),
            secondaryBackground: Container(
              height: 20,
              width: double.infinity,
            ),
            confirmDismiss: (direction) async =>
            direction == DismissDirection.endToStart,
          ),
          const Text('Unter dem Dismissable'),
        ],
      ),
    );
  }
}

class DraggableExample extends StatefulWidget {
  @override
  _DraggableExampleState createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<DraggableExample> {
  int tosses = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Draggable(
            data: tosses,
            child: Container(
              color: Colors.black12,
              height: 100,
              width: 100,
              child: Center(child: Text('Ziehen')),
            ),
            childWhenDragging: Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
            feedback: Container(
              color: Colors.green,
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(height: 100),
          DragTarget<int>(
            onAccept: (data) => ++tosses,
            onWillAccept: (tosses) => tosses.runtimeType == int,
            builder: (context, candidateData, rejectedData) {
              return Container(
                color: candidateData.isEmpty ? Colors.black12 : Colors.yellow,
                height: 100,
                width: 100,
                child: Center(
                  child: Text(tosses.toString()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SliderExample extends StatefulWidget {
  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Material'),
        Material(
          child: Slider(
            min: 0,
            max: 10,
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
        ),
        Text('Cupertino'),
        CupertinoSlider(
          min: 0,
          max: 10,
          value: sliderValue,
          onChanged: (value) {
            setState(() {
              sliderValue = value;
            });
          },
        ),
        SizedBox(height: 24),
        Text('Wert: ${sliderValue.toStringAsFixed(2)}')
      ],
    );
  }
}
