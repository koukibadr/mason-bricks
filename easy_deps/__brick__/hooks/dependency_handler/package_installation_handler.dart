import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';

import 'package_model.dart';

Future<List<PackageModel>> getPackagesToInstall() async {
  var packagesJson = jsonDecode(await File('packages.json').readAsString());
  List<PackageModel> packages = [];
  for (var json in packagesJson) {
    packages.add(PackageModel.fromJson(json));
  }
  return packages;
}

Future<void> installPackages(HookContext hookContext) async {
  List<PackageModel> listOfPackages = await getPackagesToInstall();

  hookContext.logger.info('Installing packages');

  for (var package in listOfPackages) {
    var progress = hookContext.logger.progress('Installing ${package.name}');
    ProcessResult installationResult;
    List<String> installationCommandArgs = ['pub', 'add'];

    if (package.devDependency) {
      installationCommandArgs.add('dev:${package.name}');
    } else if (package.version != null) {
      installationCommandArgs.add('${package.name}:${package.version}');
    } else {
      installationCommandArgs.add(package.name);
    }

    if (package.requireSdk) {
      installationCommandArgs.addAll(['--sdk', 'flutter']);
    }
    installationResult = await Process.run(
      "{{project_type.lowerCase()}}",
      [...installationCommandArgs, '--offline'],
    );

    if (installationResult.exitCode != 0) {
      installationResult = await Process.run(
        "{{project_type.lowerCase()}}",
        installationCommandArgs,
      );
    }
    if (installationResult.exitCode != 0) {
      progress.fail("Error: ${installationResult.stderr}");
      if (package.isRquired) {
        await Process.run('rm', ['-f', 'packages.json']);
        exit(-1);
      }
    }
    progress.complete("${package.name} installed successfully");
  }
  await Process.run('rm', ['-f', 'packages.json']);
}
