import 'package:mason/mason.dart';
import 'dependency_handler/package_installation_handler.dart';

void run(HookContext context) async {
  await installPackages(context);
}
