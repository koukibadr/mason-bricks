import 'package:mason/mason.dart';

class PackageModel {
  late String name;
  String? version;
  late bool devDependency;
  late bool requireSdk;

  PackageModel({
    required this.devDependency,
    required this.name,
    required this.requireSdk,
    this.version,
  });

  PackageModel.fromJson(Map<String, dynamic> json) {
    this.name = json["package"];
    this.version = json["version"];
    this.devDependency = json["dev_dependency"];
    this.requireSdk = json["require_sdk"];
  }
}
