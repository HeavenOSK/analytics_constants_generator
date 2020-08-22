abstract class EventNameAbstract {
  final String name;

  EventNameAbstract(this.name);
}

class EventName extends EventNameAbstract {
  EventName(String value) : super(value);

  @override
  String toString() {
    return '''static const name = '$name';''';
  }
}
