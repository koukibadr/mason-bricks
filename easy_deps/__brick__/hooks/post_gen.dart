import 'package:mason/mason.dart';
import 'dependency_handler/package_installation_handler.dart';

void run(HookContext context) async {
  PackageInstallationHandler packageInstallationHandler =
      PackageInstallationHandler(
    hookContext: context,
  );
  await packageInstallationHandler.installPackages();
}
