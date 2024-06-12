class PackageModel {
  late String name;
  String? version;
  late bool devDependency;
  late bool requireSdk;
  late bool isRquired;

  PackageModel.fromJson(Map<String, dynamic> json) {
    name = json["package"];
    version = json["version"];
    devDependency = json["dev_dependency"];
    requireSdk = json["require_sdk"] ?? false;
    isRquired = json["required"] ?? true;
  }
}
