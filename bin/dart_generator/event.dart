const _nameAt = 1;
const _firstParamAt = 2;

class Event {
  final String name;
  final List<String> params;

  Event._({
    this.name,
    this.params,
  });

  factory Event.fromLine(List<dynamic> line) {
    return Event._(
      name: line.elementAt(_nameAt) as String,
      params: line
          .sublist(_firstParamAt)
          .map((e) => e as String)
          .where((element) => element.isNotEmpty)
          .toList(),
    );
  }
}
