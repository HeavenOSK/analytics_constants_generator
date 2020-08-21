import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

ArgResults argResults;
int exitCode;
const lineNumber = 'line-number';

void main(List<String> arguments) async {
  exitCode = 0;
  final parser = ArgParser()..addFlag(lineNumber, negatable: false, abbr: 'n');
  argResults = parser.parse(arguments);
  final paths = argResults.rest;
  if (paths.isEmpty) {
    return;
  }
  final path = paths.first;
  final text = utf8.decoder.bind(File(path).openRead());
  try {
    await for (var txt in text) {
      print(txt);
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
