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
    name = json["package"];
    version = json["version"];
    devDependency = json["dev_dependency"];
    requireSdk = json["require_sdk"] ?? false;
    isRquired = json["required"] ?? true;
  }
}
