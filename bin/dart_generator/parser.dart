import 'event.dart';

const _firstEventLineIndex = 1;

class Parser {
  final List<List<dynamic>> csv;

  Parser(this.csv) : assert(csv.length > _firstEventLineIndex);

  List<Event> parse() => csv
      .sublist(_firstEventLineIndex)
      .map(
        (e) => Event.fromLine(e),
      )
      .toList();
}
