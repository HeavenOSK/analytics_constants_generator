import 'dart:io';

import 'package:csv/csv.dart';

import '../generator.dart';
import 'parser.dart';
import 'templates/analytics_event_constants.dart';

class DartGenerator implements GeneratorInterface {
  final List<List<dynamic>> csv;

  DartGenerator(this.csv);

  @override
  Future<void> generate() async {
    final events = Parser(csv).parse();
    final output = '''${AnalyticsEvent(events)}    
${events.map((_) => _.toString()).join()}
''';
    final targetFile = File('analytics_constants.dart');
    await targetFile.writeAsString(output, mode: FileMode.write);
  }
}
