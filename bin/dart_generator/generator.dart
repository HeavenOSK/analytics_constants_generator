import 'dart:io';

import 'package:csv/csv.dart';

import '../generator.dart';
import 'event_to_dart.dart';
import 'parser.dart';

class DartGenerator implements GeneratorInterface {
  final List<List<dynamic>> csv;

  DartGenerator(this.csv);

  @override
  Future<void> generate() async {
    final events = Parser(csv).parse();
    final output = events.map(eventToDart).join();
    final targetFile = File('analytics_constants.dart');
    await targetFile.writeAsString(output, mode: FileMode.write);
  }
}
