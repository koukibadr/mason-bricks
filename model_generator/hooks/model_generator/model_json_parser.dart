import 'package:mason/mason.dart';

import 'attribute_definition.dart';
import 'class_definition.dart';
import 'utility_functions.dart';

List<ClassDefinition> generateClassFromMap(
  Map<String, dynamic> json,
  String className,
) {
  List<ClassDefinition> parsedClasses = [];

  var typeListEntries = json.entries.where(
    (entry) => isEntryListObject(entry),
  );
  var typeMapEntries = json.entries.where(
    (entry) => entry.value is Map,
  );
  var premitiveTypeEntries = json.entries.where(
    (entry) => isEntryListObject(entry) == false && entry.value is Map == false,
  );

  var classAttributes = <AttributeDefinition>[];
  premitiveTypeEntries.forEach((element) {
    var attributeType = getAttributeType(element.value);
    classAttributes.add(
      AttributeDefinition(
        defaultValue: getDefaultAttributeValue(
          attributeType: attributeType,
        ),
        name: element.key,
        type: attributeType.toString().replaceAll('_', ''),
      ),
    );
  });

  typeMapEntries.forEach((element) {
    var listOfClasses = generateClassFromMap(element.value, element.key);
    parsedClasses.addAll(listOfClasses);
    classAttributes.add(AttributeDefinition(
      defaultValue: "null",
      name: element.key,
      type: '${element.key.pascalCase}',
    ));
  });

  typeListEntries.forEach((element) {
    var list = element.value as List;
    var listOfClasses = generateClassFromMap(list.first, element.key);
    parsedClasses.addAll(listOfClasses);
    classAttributes.add(AttributeDefinition(
      defaultValue: "null",
      name: element.key,
      type: '${element.key.pascalCase}',
    ));
  });

  return [
    ...parsedClasses,
    ClassDefinition(attributes: classAttributes, name: className)
  ].reversed.toList();
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

dynamic getDefaultAttributeValue({
  required Type attributeType,
}) {
  switch (attributeType) {
    case int:
      return 0;
    case String:
      return "\"\"";
    case bool:
      return false;
    case double:
      return 0.0;
    case DateTime:
      return "DateTime.now()";
    case List:
      return [];
    default:
      return Map();
  }
}
