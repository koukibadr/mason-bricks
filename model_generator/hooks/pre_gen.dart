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
      "${context.vars['json_path']} not found, make sure you have a json file with the exact dart class name under ${Directory.current.path}",
    );
    exit(-1);
  }

  var fileContent = file.readAsStringSync();
  var fileContentAsJson = jsonDecode(fileContent) as Map<String, dynamic>;

  context.vars = {
    ...context.vars,
    ...{
      'models': generateClassFromMap(
        dataToParse: fileContentAsJson,
        className: context.vars['class_name'],
      ).map((item) => item.toMap()).toList(),
    }
  };
}
