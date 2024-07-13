import 'dart:convert';
import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  File? file;
  try {
    file = File("${Directory.current.path}/${context.vars['class_name']}.json");
  } catch (e) {
    context.logger.err(
      "{{class_name}}.json not found, make sure you have a json file with the exact dart class name under ${Directory.current.path}",
    );
    exit(-1);
  }

  var fileContent = file.readAsStringSync();
  var fileContentAsJson = jsonDecode(fileContent) as Map;

  List<String> listOfAttributes = [];
  List<String> namesOfAttributes = [];
  for (var element in fileContentAsJson.entries) {
    listOfAttributes.add(
      "${element.value.runtimeType.toString()} ${element.key}",
    );
    namesOfAttributes.add('${element.key}');
  }

  context.vars = {
    ...context.vars,
    ...{
      'listOfAttributes': listOfAttributes,
      'namesOfAttributes': namesOfAttributes,
    }
  };
}
