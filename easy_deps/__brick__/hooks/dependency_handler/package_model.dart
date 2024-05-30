class PackageModel {
  late String name;
  String? version;
  late bool devDependency;
  late bool requireSdk;
  late bool isRquired;

  PackageModel({
    required this.devDependency,
    required this.name,
    required this.requireSdk,
    required this.isRquired,
    this.version,
  });

  PackageModel.fromJson(Map<String, dynamic> json) {
    this.name = json["package"];
    this.version = json["version"];
    this.devDependency = json["dev_dependency"];
    this.requireSdk = json["require_sdk"] ?? false;
    this.isRquired = json["required"] ?? true;
  }
}
