abstract class A {}
abstract class LogOutput {
  void write(String message);

  int? get id;
}

class ConsoleOutput implements LogOutput {
  @override
  int get id => 99;

  void write(String message) {}
}

abstract class SomeAnalytics implements LogOutput {
  void event(Map<String, Object> json);
}

class AppLog {
  final List<LogOutput> outputs = <LogOutput>[];

  void addOutput(LogOutput output) {
    if (outputs.contains(output)) {
      return;
    }

    outputs.add(output);
  }
}
