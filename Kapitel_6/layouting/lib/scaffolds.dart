import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldsExample extends StatefulWidget {
  @override
  _ScaffoldsExampleState createState() => _ScaffoldsExampleState();
}

class _ScaffoldsExampleState extends State<ScaffoldsExample> {
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
              // appBar: PreferredSize(
              //   preferredSize: Size.fromHeight(40),
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         ColoredBox(
              //           color: Colors.grey,
              //           child: SizedBox(height: 40, width: 40),
              //         ),
              //         ColoredBox(
              //           color: Colors.green,
              //           child: SizedBox(height: 40, width: 40),
              //         ),
              //         ColoredBox(
              //           color: Colors.blue,
              //           child: SizedBox(height: 40, width: 40),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Beispiel: Zwischenschritt zur AppBar
              // appBar: PreferredSize(
              //   preferredSize: Size.fromHeight(40),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       ColoredBox(
              //         color: Colors.grey,
              //         child: SizedBox(height: 40, width: 40),
              //       ),
              //       ColoredBox(
              //         color: Colors.green,
              //         child: SizedBox(height: 40, width: 40),
              //       ),
              //       ColoredBox(
              //         color: Colors.blue,
              //         child: SizedBox(height: 40, width: 40),
              //       ),
              //     ],
              //   ),
              // ),
              // Beispiel: AppBar
              appBar: AppBar(
                // Beispiel: leading
                // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                title: Text('AppBar'),
                // Beispiel: actionButtons
                // actions: [
                //   IconButton(icon: Icon(Icons.save), onPressed: () {}),
                //   IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                //   IconButton(icon: Icon(Icons.share), onPressed: () {}),
                // ],
              ),
              body: Center(
                child: Text('Scaffold'),
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
              ),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            height: availableHeight,
            width: halfWidth,
            // Beispiel: CupertinoPageScaffold
            child: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                middle: Text('Titel'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(icon: Icon(Icons.save), onPressed: () {}),
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                    IconButton(icon: Icon(Icons.share), onPressed: () {}),
                  ],
                ),
              ),
              child: Center(child: Text('CupertinoPageScaffold')),
            ),

            // Beispiel: CupertinoTabScaffold
            // child: CupertinoTabScaffold(
            //   controller: _cupertinoTabController,
            //   tabBuilder: (context, index) => CupertinoTabView(
            //     builder: (context) => Center(child: Text('CupertinoTabScaffold')),
            //   ),
            //
            //       CupertinoPageScaffold(
            //     navigationBar: CupertinoNavigationBar(
            //       middle: Text('Title: $index'),
            //     ),
            //     child: Center(child: Text('$index')),
            //   ),
            //   tabBar: CupertinoTabBar(
            //     items: [
            //       BottomNavigationBarItem(
            //         icon: Icon(Icons.home),
            //         label: 'Home',
            //       ),
            //       BottomNavigationBarItem(
            //         icon: Icon(Icons.chat),
            //         label: 'Chat',
            //       ),
            //       BottomNavigationBarItem(
            //         icon: Icon(Icons.info),
            //         label: 'Impressum',
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
