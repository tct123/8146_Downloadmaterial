import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../lib/app_log.dart';

@GenerateMocks([A])
void main() {

  group('Output tests', () {
    test('Output is only added once', () {
      final appLog = AppLog();
      final consoleOutput = ConsoleOutput();
      appLog.addOutput(consoleOutput);
      appLog.addOutput(consoleOutput);

      expect(appLog.outputs.length, equals(1));
    });

    test('After adding, outputs are not empty', () {
      final appLog = AppLog();
      final consoleOutput = ConsoleOutput();
      appLog.addOutput(consoleOutput);

      // ohne Matcher
      expect(appLog.outputs.isNotEmpty, true);
      // mit Boolean Matcher
      expect(appLog.outputs.isNotEmpty, isTrue);
      // mit Collection Matcher
      expect(appLog.outputs, isNotEmpty);
    });
  });

  test('Can use any Output', () {
    final appLog = AppLog();
    final consoleOutput = ConsoleOutput();
    final outputMock = MockOutput();
    when(outputMock.id).thenReturn(42);

    appLog.addOutput(consoleOutput);
    appLog.addOutput(outputMock);

    for (final output in appLog.outputs) {
      expect(output.id, isNotNull);
      print('Output Id: ${output.id}');
    }
  });
}

class MockOutput extends Mock implements LogOutput {}