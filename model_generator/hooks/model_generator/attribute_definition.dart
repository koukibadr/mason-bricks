class AttributeDefinition {
  final String name;
  final String type;

  AttributeDefinition({
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'type': type,
      };
}
