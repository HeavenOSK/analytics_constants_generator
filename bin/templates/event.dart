const _nameAt = 1;
const _firstParamAt = 2;

class Event {
  final String eventName;
  final List<String> params;

  Event._({
    this.eventName,
    this.params,
  });

  factory Event.fromLine(List<dynamic> line) {
    return Event._(
      eventName: line.elementAt(_nameAt) as String,
      params: line
          .sublist(_firstParamAt)
          .map((e) => e as String)
          .where((element) => element.isNotEmpty)
          .toList(),
    );
  }
}
