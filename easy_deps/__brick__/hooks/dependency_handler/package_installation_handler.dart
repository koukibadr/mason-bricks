import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';

import 'package_model.dart';

class PackageInstallationHandler {
  late File packageJsonFile;
  final HookContext hookContext;

  PackageInstallationHandler({
    required this.hookContext,
  }) {
    packageJsonFile = File('packages.json');
  }

  Future<List<PackageModel>> getPackagesToInstall() async {
    var packagesJson = jsonDecode(await packageJsonFile.readAsString());
    List<PackageModel> packages = [];
    for (var json in packagesJson) {
      packages.add(PackageModel.fromJson(json));
    }
    return packages;
  }

  Future<void> installPackages() async {
    List<PackageModel> listOfPackages = await getPackagesToInstall();
    hookContext.logger.info('Installing packages');
    for (var package in listOfPackages) {
      hookContext.logger.info('Installing ${package.name}');
      ProcessResult installationResult;
      List<String> installationCommandArgs = ['pub', 'add'];
      if (package.devDependency) {
        installationCommandArgs.add('dev:${package.name}');
      } else if (package.version != null) {
        installationCommandArgs.add('${package.name}:${package.version}');
      } else {
        installationCommandArgs.add('${package.name}');
      }
      if (package.requireSdk) {
        installationCommandArgs.addAll(['--sdk', 'flutter']);
      }
      installationResult = await Process.run(
        'flutter',
        [...installationCommandArgs, '--offline'],
      );
      if (installationResult.exitCode != 0) {
        installationResult = await Process.run(
          'flutter',
          installationCommandArgs,
        );
      }
      if (installationResult.exitCode != 0) {
        hookContext.logger.write('Error: ${installationResult.stderr}\n');
        await Process.run('rm', ['-f', 'packages.json']);
        exit(-1);
      }
    }
    await Process.run('rm', ['-f', 'packages.json']);
  }
}
