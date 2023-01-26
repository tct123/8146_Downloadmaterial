import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AspectRatioExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.61,
      child: ColoredBox(
        color: Colors.green,
      ),
    );
  }
}

class ConstrainedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 400,
        minHeight: 100,
        maxWidth: 400,
        minWidth: 100,
      ),
      child: ColoredBox(color: Colors.green),
    );
  }
}

class SizedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: ColoredBox(color: Colors.green),
    );
  }
}

class SizedBoxInListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Erster Text'),
        const SizedBox(height: 20),
        Text('Zweiter Text'),
      ],
    );
  }
}

class UnconstrainedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      clipBehavior: Clip.hardEdge,
      constrainedAxis: Axis.horizontal,
      child: ColoredBox(
        color: Colors.green,
        child: SizedBox(height: 800, width: 80),
      ),
    );
  }
}

class FittedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 400,
      child: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          height: 800,
          width: 800,
          child: ColoredBox(color: Colors.green),
        ),
      ),
    );
  }
}

class FractionallySizedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      widthFactor: 0.3,
      child: ColoredBox(color: Colors.green),
    );
  }
}

class LimitedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LimitedBox(
          maxHeight: 50,
          child: ListView(
            children: [
              Text('Hallo,  Welt!'),
            ],
          ),
        )
      ],
    );
  }
}

class OverflowBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 400,
        color: Colors.black12,
        child: OverflowBox(
          maxHeight: 500,
          maxWidth: 500,
          minHeight: 150,
          minWidth: 150,
          child: Container(
            height: 500,
            width: 150,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

class SizedOverflowBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 350,
          maxHeight: 350,
        ),
        child: SizedOverflowBox(
          size: Size(200, 200),
          child: Container(
            height: 500,
            width: 150,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

class IntrinsicHeightFailExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Expanded(child: Text('Erste Zeile')),
            SizedBox(height: 16),
            Expanded(child: Text('Zweite Zeile')),
          ],
        ),
      ],
    );
  }
}

class IntrinsicHeightExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          IntrinsicHeight(
            child: Column(
              children: [
                Expanded(child: Text('Erste Zeile')),
                SizedBox(height: 16),
                Expanded(child: Text('Zweite Zeile')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widgets = List.generate(
          100,
          (index) => Center(child: Text(index.toString())),
        );

        if (constraints.maxWidth < 600) {
          return ListView(children: widgets);
        } else {
          return GridView.count(crossAxisCount: 2, children: widgets);
        }
      },
    );
  }
}

class SliverLayoutBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverLayoutBuilder(
          builder: (context, sliverConstraints) {
            final widgets = List.generate(
              100,
              (index) => Center(child: Text(index.toString())),
            );

            if (sliverConstraints.crossAxisExtent < 600) {
              return SliverList(delegate: SliverChildListDelegate(widgets));
            } else {
              return SliverGrid(
                delegate: SliverChildListDelegate(widgets),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              );
            }
          },
        )
      ],
    );
  }
}
