import 'package:recase/recase.dart';

import 'event.dart';

String eventToDart(Event event) {
  var code = '\n';
  final eventClassName = '${ReCase(event.name).pascalCase}Event';
  final paramsClassName = '_${eventClassName}Params';

  code += '''class $eventClassName {
  static const name = '${event.name}';
  static const params = $paramsClassName();
}

class $paramsClassName {
  const $paramsClassName();
  
''';
  code += event.params.map((param) => _paramsToDartVariable(param)).join();
  code += '}';
  return code;
}

String _paramsToDartVariable(String rawParam) {
  final paramVariableName = ReCase(rawParam).camelCase;
  return '''
  static const $paramVariableName = '$rawParam';
''';
}
