import 'dart:io';

import 'package:mason/mason.dart';
import 'handler/package_installation_handler.dart';

void run(HookContext context) async {
  PackageInstallationHandler packageInstallationHandler =
      PackageInstallationHandler(
    hookContext: context,
  );
  await packageInstallationHandler.installPackages();
  context.logger.info('> flutter gen-l10n');
  var genCodeResponse = await Process.run('flutter', ['gen-l10n']);
  if (genCodeResponse.exitCode != 0) {
    context.logger.err(genCodeResponse.stderr);
  }
}
