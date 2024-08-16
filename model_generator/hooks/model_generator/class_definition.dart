import 'attribute_definition.dart';

class ClassDefinition {
  final String name;
  final List<AttributeDefinition> attributes;

  ClassDefinition({
    required this.attributes,
    required this.name,
  });

  Map<String, dynamic> toMap() => {
        'class': name,
        'attributes': attributes
            .map(
              (attribute) => attribute.toMap(),
            )
            .toList()
      };
}
