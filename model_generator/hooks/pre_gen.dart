import 'dart:convert';
import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  File? file;
  try {
    file = File(context.vars['json_path']);
  } on PathNotFoundException {
    context.logger.err(
      "{{class_name}}.json not found, make sure you have a json file with the exact dart class name under ${Directory.current.path}",//TODO update error message
    );
    exit(-1);
  }

  var fileContent = file.readAsStringSync();
  var fileContentAsJson = jsonDecode(fileContent) as Map;

  List<Map<String, dynamic>> attributes = [];
  for (var element in fileContentAsJson.entries) {
    var attributeType = getAttributeType(element.value);
    attributes.add({
      'type': attributeType.toString().replaceAll('_', ''),
      'name': element.key,
      'defaultValue': getDefaultAttributeValue(attributeType),
    });
  }

  context.vars = {
    ...context.vars,
    ...{
      'attributes': attributes,
    }
  };
}

Type getAttributeType(dynamic attributeValue) {
  if (attributeValue.runtimeType == String) {
    var dateTimeValue = DateTime.tryParse(attributeValue);
    if (dateTimeValue != null) {
      return DateTime;
    } else {
      return String;
    }
  } else {
    return attributeValue.runtimeType;
  }
}

dynamic getDefaultAttributeValue(Type attributeType) {
  switch (attributeType) {
    case int:
      return 0;
    case String:
      return "\"\"";
    case bool:
      return false;
    case double:
      return 0.0;
    case List:
      return [];
    case DateTime:
      return "DateTime.now()";
    default:
      return Map();
  }
}
