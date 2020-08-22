import 'package:recase/recase.dart';

import 'params.dart';

const _nameAt = 1;
const _firstParamAt = 2;

class Event {
  final String name;
  final Params params;

  Event._({
    this.name,
    this.params,
  });

  factory Event.fromLine(List<dynamic> line) {
    final name = line.elementAt(_nameAt) as String;
    return Event._(
      name: name,
      params: Params(
        name,
        line
            .sublist(_firstParamAt)
            .map((e) => e as String)
            .where((element) => element.isNotEmpty)
            .map((e) => Param(e))
            .toList(),
      ),
    );
  }

  String get className => '_${ReCase(name).pascalCase}Event';

  @override
  String toString() {
    return '''class $className {
  static const name = '$name';
  static const params = ${params.className}();
}

$params

''';
  }
}
