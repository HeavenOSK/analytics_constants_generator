import 'package:recase/recase.dart';

class Param {
  final String value;

  Param(this.value);

  @override
  String toString() {
    final paramVariableName = ReCase(value).camelCase;
    return '''  static const $paramVariableName = '$value';
''';
  }
}

class Params {
  final String eventName;
  final List<Param> params;

  Params(this.eventName, this.params);

  String get className {
    final eventClassName = '${ReCase(eventName).pascalCase}Event';
    return '_${eventClassName}Params';
  }

  @override
  String toString() {
    return '''class $className {
  const $className();
  
${params.map((_) => _.toString()).join()}
}
''';
  }
}