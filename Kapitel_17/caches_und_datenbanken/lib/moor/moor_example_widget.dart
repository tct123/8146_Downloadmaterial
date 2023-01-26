import 'package:flutter/material.dart';

import 'moor_example.dart';

class MoorExampleWidget extends StatefulWidget {
  @override
  _MoorExampleWidgetState createState() => _MoorExampleWidgetState();
}

class _MoorExampleWidgetState extends State<MoorExampleWidget> {
  final database = AppDatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    database.addTodo('Nino begrüßen');
                  },
                  child: Text('ToDo hinzufügen')),
              ElevatedButton(
                  onPressed: () {
                    database.updateTodo(4, 'Nino eine Nachricht schreiben');
                  },
                  child: Text('ToDo updaten')),
              ElevatedButton(
                  onPressed: () async {
                    final todos = await database.getTodos();
                    todos.forEach(print);
                  },
                  child: Text('ToDos ausgeben')),
              ElevatedButton(
                  onPressed: () async {
                    final todos = await database.getTodos();
                    todos.forEach((todo) => database.deleteTodo(todo.id));
                  },
                  child: Text('ToDo löschen')),
              ElevatedButton(
                  onPressed: () {
                    database.clear();
                  },
                  child: Text('Clear')),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }
}
