import 'dart:ui';

import 'package:flutter/material.dart';

class CenterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 2,
      child: Text('zentriert'),
    );
  }
}

class AlignExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text('unten links'),
    );
  }
}

class PaddingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 100, 40, 0),
      child: Text('Padding'),
    );
  }
}

class PaddingExample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, top: 100, right: 40),
      child: Text('Padding'),
    );
  }
}

class PaddingExample3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100),
      child: Text('Padding'),
    );
  }
}

class BaselineExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Baseline(
        baselineType: TextBaseline.alphabetic,
        baseline: -20,
        child: Text('Baseline -20'),
      ),
    );
  }
}

class SafeAreaExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text('SafeArea'),
    );
  }
}

class ColumnMainAxisAlignmentExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColoredBox(
            color: Colors.grey,
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Erste Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Zweite Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Dritte Zeile'))),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
          ColoredBox(
            color: Colors.lightGreen,
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Erste Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Zweite Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Dritte Zeile'))),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          ColoredBox(
            color: Colors.orangeAccent,
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Erste Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Zweite Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Dritte Zeile'))),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ],
      ),
    );
  }
}

class ColumnCrossAxisAlignmentExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: [
              Text(
                'Start',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Erste Zeile'),
              Text('Zweite Zeile und etwas länger in der Mitte'),
              Text('Dritte Zeile'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.up,
            children: [
              Text(
                'Center',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Erste Zeile'),
              Text('Zweite Zeile und etwas länger in der Mitte'),
              Text('Dritte Zeile'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            verticalDirection: VerticalDirection.up,
            children: [
              Text(
                'End',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Erste Zeile'),
              Text('Zweite Zeile und etwas länger in der Mitte'),
              Text('Dritte Zeile'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            verticalDirection: VerticalDirection.up,
            children: [
              Text(
                'Stretch',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Erste Zeile'),
              Text('Zweite Zeile und etwas länger in der Mitte'),
              Text('Dritte Zeile'),
            ],
          ),
        ],
      ),
    );
  }
}

class RowMainAxisAlignmentExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColoredBox(
            color: Colors.grey,
            child: Row(
              children: [
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Erste Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Zweite Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Dritte Zeile'))),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
          ColoredBox(
            color: Colors.lightGreen,
            child: Row(
              children: [
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Erste Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Zweite Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Dritte Zeile'))),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          ColoredBox(
            color: Colors.orangeAccent,
            child: Row(
              children: [
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Erste Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Zweite Zeile'))),
                Container(
                    height: 30,
                    width: 100,
                    color: Theme.of(context).colorScheme.surface,
                    child: Center(child: Text('Dritte Zeile'))),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ],
      ),
    );
  }
}

class RowOverflowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Expanded:', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Text('Erster Text', style: TextStyle(fontSize: 40))),
            Expanded(
                child: Text('Zweiter Text', style: TextStyle(fontSize: 40))),
            Expanded(
                child: Text('Dritter Text', style: TextStyle(fontSize: 40))),
          ],
        ),
        const SizedBox(height: 100),
        Text('Flexible:', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Flexible(
                flex: 2,
                child: Text('Erster Text', style: TextStyle(fontSize: 40))),
            Expanded(
                child: Text('Zweiter Text', style: TextStyle(fontSize: 40))),
            Expanded(
                child: Text('Dritter Text', style: TextStyle(fontSize: 40))),
          ],
        ),
      ],
    );
  }
}

class SpacerColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text('Erste Zeile')),
          Expanded(child: Text('Zweite Zeile')),
          Expanded(child: Text('Dritte Zeile')),
          Spacer(flex: 2),
          Expanded(child: Text('Mit Abstand das Ende')),
        ],
      ),
    );
  }
}

class ListViewListCtorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Erstes Item'),
        Text('Zweites Item'),
        Text('Drittes Item'),
      ],
    );
  }
}

class ListViewListPhysicsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        Text('Erstes Item2'),
        Text('Zweites Item'),
        Text('Drittes Item'),
      ],
    );
  }
}

class ListViewNeverScrollExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Text('Erstes Item'),
        Text('Zweites Item'),
        Text('Drittes Item'),
      ],
    );
  }
}

class ListViewWithScrollControllerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(initialScrollOffset: 100),
      children: [
        Text('Erstes Item'),
        Text('Zweites Item'),
        Text('Drittes Item'),
        // ...
      ],
    );
  }
}

class ListViewBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = ('Item ' * 100).split(' ')
      ..removeWhere((item) => item.isEmpty);

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Text(items.elementAt(index) + (++index).toString());
      },
    );
  }
}

class ListViewSeparatorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = ('Item ' * 100).split(' ')
      ..removeWhere((item) => item.isEmpty);

    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(items.elementAt(index)),
        onTap: () {},
      ),
      separatorBuilder: (context, _) => Divider(),
    );
  }
}

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: [
        ColoredBox(color: Colors.grey, child: Center(child: Text('1'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('2'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('3'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('4'))),
      ],
    );
  }
}

class GridViewExtendExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 80,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: [
        ColoredBox(color: Colors.grey, child: Center(child: Text('1'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('2'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('3'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('4'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('5'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('6'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('7'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('8'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('9'))),
      ],
    );
  }
}

class GridViewBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = ('Item ' * 100).split(' ')
      ..removeWhere((item) => item.isEmpty);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.61,
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ColoredBox(
            color: Colors.grey,
            child: Center(
                child: Text(items.elementAt(index) + (++index).toString())));
      },
    );
  }
}

class ScrollDirectionExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: [
        ColoredBox(color: Colors.grey, child: Center(child: Text('1'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('2'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('3'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('4'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('5'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('6'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('7'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('8'))),
        ColoredBox(color: Colors.grey, child: Center(child: Text('9'))),
      ],
    );
  }
}

class ShrinkWrapFailureExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView(
          children: [
            Text('Hallo, Welt'),
          ],
        )
      ],
    );
  }
}

class ShrinkWrapExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            Text('Hallo, Welt'),
          ],
        )
      ],
    );
  }
}

class SingleChildScrollViewWithoutScrollExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hallo, Welt',
      style: TextStyle(fontSize: 400),
    );
  }
}

class SingleChildScrollViewWithScrollExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        'Hallo, Welt',
        style: TextStyle(fontSize: 400),
      ),
    );
  }
}

class ScrollbarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Text(
          'Hallo, Welt',
          style: TextStyle(fontSize: 400),
        ),
      ),
    );
  }
}

class PageViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (index) => print('Seite: ${++index}'),
      scrollDirection: Axis.vertical,
      children: [
        ColoredBox(color: Colors.red),
        ColoredBox(color: Colors.green),
        ColoredBox(color: Colors.blue),
      ],
    );
  }
}

class KeepAliveClientMixinExample extends StatefulWidget {
  const KeepAliveClientMixinExample({required this.index});

  final int index;

  @override
  _KeepAliveClientMixinExampleState createState() =>
      _KeepAliveClientMixinExampleState();
}

// Beispiel ohne Implementierung von Mixin
// class _KeepAliveClientMixinExampleState
//     extends State<KeepAliveClientMixinExample> {
//   @override
//   Widget build(BuildContext context) {
//     return Text('Keep Alive, please! Index: ${widget.index}');
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     print('Disposed: ${widget.index}');
//   }
// }

// Beispiel mit Implementierung von Mixin
class _KeepAliveClientMixinExampleState
    extends State<KeepAliveClientMixinExample>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text('Keep Alive, please! Index: ${widget.index}');
  }

  @override
  void dispose() {
    super.dispose();

    print('Disposed: ${widget.index}');
  }

  @override
  bool get wantKeepAlive => true;
}

class KeepAliveClientWidgetUsageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widgets = List.generate(
        200, (index) => KeepAliveClientMixinExample(index: index));

    return ListView(
      children: widgets,
    );
  }
}

class NotificationListenerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        print(notification.runtimeType.toString());
        // Wir definieren die Notification als behandelt
        return true;
      },
      child: SingleChildScrollView(
        child: Text(
          'Hallo, Welt',
          style: TextStyle(fontSize: 400),
        ),
      ),
    );
  }
}

class TableExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(children: [Text('links oben'), Text('rechts oben')]),
            TableRow(children: [Text('links unten'), Text('rechts unten')]),
          ],
        ),
      ),
    );
  }
}

class TableFixedWithExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          columnWidths: {
            0: FractionColumnWidth(0.3),
            1: FractionColumnWidth(0.7),
          },
          border: TableBorder.all(),
          children: [
            TableRow(children: [Text('links oben'), Text('rechts oben')]),
            TableRow(children: [Text('links unten'), Text('rechts unten')]),
          ],
        ),
      ),
    );
  }
}

class StackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: Colors.black12,
            ),
          ),
          Positioned(
            height: 200,
            width: 200,
            top: 280,
            left: 115,
            child: ColoredBox(color: Colors.green),
          ),
          Center(
            child: Text(
              'Hallo Stack',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Text(
            'Startpunkt unten links',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class IndexedStackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: 3,
      alignment: Alignment.bottomLeft,
      children: [
        Positioned.fill(
          child: ColoredBox(
            color: Colors.black12,
          ),
        ),
        Positioned(
          height: 200,
          width: 200,
          top: 280,
          left: 115,
          child: ColoredBox(color: Colors.green),
        ),
        Center(
          child: Text(
            'Hallo Stack',
            style: TextStyle(fontSize: 24),
          ),
        ),
        Text(
          'Startpunkt unten links',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class WrapExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        runSpacing: 40,
        alignment: WrapAlignment.end,
        children: [
          Text(
            'Der erste Text',
            style: TextStyle(fontSize: 34),
          ),
          Text(
            'Der zweite Text',
            style: TextStyle(fontSize: 34),
          ),
          Text(
            'Der dritte Text',
            style: TextStyle(fontSize: 34),
          ),
        ],
      ),
    );
  }
}

class SliverExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widgets = List.generate(
      200,
      (index) => Text('A Text, please! Index: $index'),
    );
    final sliverListChildren = widgets.take(100).toList();
    final sliverGridChildren = widgets.skip(100).toList();

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Titel in der AppBar'),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => sliverListChildren.elementAt(index),
            childCount: sliverListChildren.length,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.green,
            height: 200,
          ),
        ),
        SliverGrid(
          delegate: SliverChildListDelegate(sliverGridChildren),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        )
      ],
    );
  }
}

class SliverFillViewPortExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillViewport(
          delegate: SliverChildListDelegate(
            [
              ColoredBox(color: Colors.red),
              ColoredBox(color: Colors.green),
              ColoredBox(color: Colors.blue),
            ],
          ),
        ),
      ],
    );
  }
}
