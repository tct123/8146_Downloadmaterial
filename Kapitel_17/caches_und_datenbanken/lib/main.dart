import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class SharedPreferencesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final sharedPreferences =
                      await SharedPreferences.getInstance();
                  await sharedPreferences.setBool('dieEntscheidung', false);
                  await sharedPreferences.setDouble('paketgewicht', 5.15);
                  await sharedPreferences.setInt('eineZahl', 280682);
                  await sharedPreferences.setString(
                    'beschreibung',
                    'Ein Inhalt',
                  );
                  await sharedPreferences.setStringList(
                    'inhalte',
                    [
                      'Eine',
                      'Liste',
                      'von',
                      'Inhalten',
                    ],
                  );
                },
                child: Text(
                  'Schreiben',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final sharedPreferences =
                      await SharedPreferences.getInstance();

                  final getBool = sharedPreferences.getBool('dieEntscheidung');
                  final getDouble = sharedPreferences.getDouble('paketgewicht');
                  final getInt = sharedPreferences.getInt('eineZahl');
                  final getString = sharedPreferences.getString('beschreibung');
                  final getStringList =
                      sharedPreferences.getStringList('inhalte');

                  final getResult = sharedPreferences.get('unbekannt');
                  if (getResult is bool) {
                    // als bool behandeln
                  } else if (getResult is String) {
                    // als String behandeln
                  }
                  // ...
                },
                child: Text(
                  'Lesen',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final sharedPreferences =
                      await SharedPreferences.getInstance();

                  // nur einen Eintrag entfernen
                  sharedPreferences.remove('inhalte');

                  // ...
                  // Cache zurücksetzen
                  sharedPreferences.clear();
                },
                child: Text('Weiteres'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CacheManagerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<FileResponse>(
                stream: DefaultCacheManager()
                    .getImageFile('https://via.placeholder.com/200'),
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) {
                    return SizedBox.shrink();
                  }

                  final fileInfo = snapshot.data as FileInfo;
                  final imageData = fileInfo.file;
                  return Image.file(imageData);
                },
              ),
            ),
            Expanded(
              child: StreamBuilder<FileResponse>(
                stream: DefaultCacheManager().getFileStream(
                    'https://jsonplaceholder.typicode.com/todos'),
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) {
                    return SizedBox.shrink();
                  }

                  final fileInfo = snapshot.data as FileInfo;
                  final imageData = fileInfo.file;
                  return Text(imageData.readAsStringSync());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void customCache() async {
    CacheManager(
      Config(
        // Name der Datenbank und des Ordners
        'customCache',
        // maximal 42 Elemente im Cache halten
        maxNrOfCacheObjects: 42,
        // wenn eine Datei 2 Tage nicht benutzt wurde,
        // dann automatisch löschen
        stalePeriod: Duration(days: 2),
      ),
    );
    DefaultCacheManager().putFile(
      'eine_datei',
      Uint8List.fromList(utf8.encode('der_inhalt_der_datei').toList()),
      maxAge: Duration(hours: 2),
      fileExtension: 'txt',
    );

    DefaultCacheManager().putFileStream(
      'eine_datei',
      // ein Stream ...
      Stream.value(utf8.encode('der_inhalt_der_datei')),
      maxAge: Duration(hours: 2),
      fileExtension: 'txt',
    );

    // DefaultCacheManager().downloadFile(url)
    // DefaultCacheManager().removeFile('url_oder_eigener_key');

    // DefaultCacheManager().getFileFromMemory(key);
  }
}

class SqfliteExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = AppDatabase();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    database.init();
                  },
                  child: Text('Init')),
              ElevatedButton(
                  onPressed: () {
                    database.createTodos();
                  },
                  child: Text('ToDos erstellen')),
              ElevatedButton(
                  onPressed: () {
                    database.addTodo('Nino begrüßen');
                  },
                  child: Text('ToDo hinzufügen')),
              ElevatedButton(
                  onPressed: () {
                    database.updateTodo(2, 'Nino eine Nachricht schreiben');
                  },
                  child: Text('ToDo updaten')),
              ElevatedButton(
                  onPressed: () async {
                    final todos = await database.getTodos();
                    todos.forEach(print);
                  },
                  child: Text('ToDos ausgeben')),
              ElevatedButton(
                  onPressed: () {
                    database.deleteTodo(1);
                  },
                  child: Text('ToDo löschen')),
            ],
          ),
        ),
      ),
    );
  }
}

/// Kapselt die Datenbank
class AppDatabase {
  late Database _db;

  void init() async {
    final pathToDb = await getDatabasesPath();
    _db = await openDatabase(pathToDb + 'app.db');
  }

  void createTodos() async {
    await _db.execute(
      'CREATE TABLE ToDo (id INTEGER PRIMARY KEY, title TEXT)',
    );
  }

  void addTodo(String title) {
    _db.rawInsert('INSERT INTO ToDo(title) VALUES (?)', [title]);

    // _db.insert('ToDo', {'title': title});
  }

  void updateTodo(int id, String title) {
    _db.rawUpdate('UPDATE ToDo SET title=? WHERE id=?', [title, id]);

    // _db.update('ToDo', {'title': title}, where: 'id=?', whereArgs: [id]);
  }

  Future<List<Map<String, Object?>>> getTodos() async {
    final rawTodos = await _db.rawQuery('SELECT * FROM ToDo');

    final todos = await _db.query('ToDo');
    return todos;
  }

  void deleteTodo(int id) {
    _db.rawDelete('DELETE FROM ToDo WHERE id=?', [id]);

    // _db.delete('ToDo', where: 'id=?', whereArgs: [id]);
  }
}
