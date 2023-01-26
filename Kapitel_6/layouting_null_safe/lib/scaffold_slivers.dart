import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldSliversExample extends StatefulWidget {
  @override
  _ScaffoldSliversExampleState createState() => _ScaffoldSliversExampleState();
}

class _ScaffoldSliversExampleState extends State<ScaffoldSliversExample> {
  int _currentMaterialTab = 0;

  CupertinoTabController _cupertinoTabController = CupertinoTabController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height;

    final availableWidth = mediaQuery.size.width;
    final halfWidth = availableWidth / 2 - 10;

    return ColoredBox(
      color: Colors.grey,
      child: Row(
        children: [
          SizedBox(
            height: availableHeight,
            width: halfWidth,
            child: Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leading: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {},
                      ),
                      title: Text('AppBar'),
                      actions: [
                        IconButton(icon: Icon(Icons.save), onPressed: () {}),
                        IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                        IconButton(icon: Icon(Icons.share), onPressed: () {}),
                      ],
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        [Text('Scaffold Sliver Beispiel ' * 1000)],
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentMaterialTab,
                  onTap: (index) => setState(() => _currentMaterialTab = index),
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat),
                      label: 'Chat',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.info),
                      label: 'Impressum',
                    ),
                  ],
                )),
          ),
          const SizedBox(width: 20),
          SizedBox(
            height: availableHeight,
            width: halfWidth,
            child: CupertinoTabScaffold(
              tabBuilder: (context, index) => CustomScrollView(
                slivers: [
                  CupertinoSliverNavigationBar(
                    leading:
                        IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                    largeTitle: Text('Titel'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: Icon(Icons.save), onPressed: () {}),
                        IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                        IconButton(icon: Icon(Icons.share), onPressed: () {}),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [Text('Cupertino Sliver Beispiel ' * 1000)],
                    ),
                  )
                ],
              ),
              tabBar: CupertinoTabBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    label: 'Impressum',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
