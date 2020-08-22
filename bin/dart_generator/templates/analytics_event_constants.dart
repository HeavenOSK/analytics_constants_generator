import 'package:recase/recase.dart';

import 'event.dart';

extension _EventField on Event {
  String get asAnalyticsEventField => '''
  static const ${ReCase(name).camelCase} = $className();
''';
}

class AnalyticsEvent {
  final List<Event> events;

  AnalyticsEvent(this.events);

  @override
  String toString() {
    return '''class $AnalyticsEvent {
${events.map((e) => e.asAnalyticsEventField).join()}}
''';
  }
}
