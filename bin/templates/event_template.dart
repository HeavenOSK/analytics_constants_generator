import 'event_name.dart';
import 'event_param.dart';

abstract class EventTemplateAbstract {
  final String value;
  final List<EventParamAbstract> params;

  EventTemplateAbstract(this.value, this.params);
}

class EventTemplate extends EventTemplateAbstract {
  EventTemplate(String value, List<EventParamAbstract> params)
      : super(value, params);
  @override
  String toString() {
  }
}
