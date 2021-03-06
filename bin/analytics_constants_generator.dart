import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:csv/csv.dart';

import 'dart_generator/generator.dart';


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
  try {
    final raw = utf8.decoder.bind(File(path).openRead());
    final converter = CsvToListConverter();
    await for (var txt in raw) {
      final csv = converter.convert(txt);
      final generator = DartGenerator(csv);
      await generator.generate();
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
