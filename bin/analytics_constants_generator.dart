import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:csv/csv.dart';

ArgResults argResults;
int exitCode;
const lineNumber = 'line-number';

void main(List<String> arguments) async {
  exitCode = 0;
  argResults = ArgParser().parse(arguments);
  final paths = argResults.rest;
  if (paths.isEmpty) {
    return;
  }
  final path = paths.first;
  final csv = utf8.decoder.bind(File(path).openRead());
  final parser = CsvToListConverter();
  try {
    await for (var txt in csv) {
      for (var line in parser.convert(txt)) {
        print(line);
      }
    }
  } catch (_) {
    await _handleError(path);
  }
}

Future _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('error: $path is a directory');
  } else {
    exitCode = 2;
  }
}
