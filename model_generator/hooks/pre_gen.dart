import 'dart:convert';
import 'dart:io';
import 'package:mason/mason.dart';

import 'model_generator/model_json_parser.dart';

void run(HookContext context) {
  File? file;
  try {
    file = File(context.vars['json_path']);
  } on PathNotFoundException {
    context.logger.err(
      "{{class_name}}.json not found, make sure you have a json file with the exact dart class name under ${Directory.current.path}", //TODO update error message
    );
    exit(-1);
  }

  var fileContent = file.readAsStringSync();
  var fileContentAsJson = jsonDecode(fileContent) as Map<String, dynamic>;

  context.vars = {
    ...context.vars,
    ...{
      'models':
          generateClassFromMap(fileContentAsJson, context.vars['class_name'])
              .map((item) => item.toMap())
              .toList(),
    }
  };
}
