import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  //var filePath = context.logger.prompt('Enter your json file relative path');
  //context.logger.prompt(Directory.current.path);
  var file = File("${Directory.current.path}/lib/data/${context.vars['class_name']}.json");
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
