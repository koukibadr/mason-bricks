class AttributeDefinition {
  final String name;
  final String type;
  final dynamic defaultValue;

  AttributeDefinition({
    required this.defaultValue,
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'type': type,
        'defaultValue': defaultValue,
      };
}
