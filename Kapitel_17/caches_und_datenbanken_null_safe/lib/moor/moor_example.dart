import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';

part 'moor_example.g.dart';

// Dbo kurz für Database Object
@DataClassName('TodoDbo')
class Todos extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get title => text()();
}

// void createTodos
@UseMoor(tables: [Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // void init() ...
      : super(
          LazyDatabase(
            () async {
              final pathToDb = await getApplicationDocumentsDirectory();
              return VmDatabase(File(pathToDb.path + 'moor_app.db'));
            },
          ),
        );

  @override
  int get schemaVersion => 1;

  void addTodo(String title) {
    into(todos).insert(TodoDbo(title: title));
  }

  void updateTodo(int id, String title) async {
    // Ähnlich wie ein HTTP PATCH-Request einer API
    final companion = TodosCompanion(title: Value(title));

    (update(todos)..where((row) => row.id.equals(id))).write(companion);
  }

  Future<Iterable<TodoDbo>> getTodos() {
    return select(todos).get();
  }

  void deleteTodo(int id) {
    (delete(todos)..where((todo) => todo.id.equals(id))).go();
  }

  void clear() {
    delete(todos).go();
  }
}
