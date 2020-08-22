import 'package:recase/recase.dart';

abstract class EventParamAbstract {
  final String name;

  EventParamAbstract(this.name);
}

class EventParam extends EventParamAbstract {
  EventParam(String value) : super(value);

  @override
  String toString() => '''static const ${ReCase(name).camelCase} = '$name';''';
}

class EventParams {
  
}
