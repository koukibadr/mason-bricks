import 'package:mason/mason.dart';

import 'attribute_definition.dart';
import 'class_definition.dart';
import 'utility_functions.dart';

List<ClassDefinition> generateClassFromMap({
  required Map<String, dynamic> dataToParse,
  required String className,
}) {
  List<ClassDefinition> parsedClasses = [];

  var typeListEntries = dataToParse.entries.where(
    (entry) => isEntryListObject(entry),
  );
  var typeMapEntries = dataToParse.entries.where(
    (entry) => isEntryMapObject(entry),
  );
  var premitiveTypeEntries = dataToParse.entries.where(
    (entry) =>
        isEntryListObject(entry) == false && isEntryMapObject(entry) == false,
  );

  var classAttributes = <AttributeDefinition>[];
  premitiveTypeEntries.forEach((element) {
    var attributeType = getAttributeType(element.value);
    classAttributes.add(
      AttributeDefinition(
        name: element.key,
        type: attributeType.toString().replaceAll('_', ''),
      ),
    );
  });

  typeMapEntries.forEach((element) {
    var listOfClasses = generateClassFromMap(
      dataToParse: element.value,
      className: element.key,
    );
    parsedClasses.addAll(listOfClasses);
    classAttributes.add(
      AttributeDefinition(
        name: element.key,
        type: '${element.key.pascalCase}',
      ),
    );
  });

  typeListEntries.forEach((element) {
    var list = element.value as List;
    var listOfClasses = generateClassFromMap(
      dataToParse: list.first,
      className: element.key,
    );
    parsedClasses.addAll(listOfClasses);
    classAttributes.add(
      AttributeDefinition(
        name: element.key,
        type: '${element.key.pascalCase}',
      ),
    );
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
