import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  var progress = context.logger.progress('Installing packages');
  await Process.run('flutter', ['pub', 'add', 'intl']);
  await Process.run('flutter', ['pub', 'add', 'flutter_localization','--sdk','flutter']);
  progress.complete();

  progress = context.logger.progress('Generating localization');
  await Process.run('flutter', ['gen-l10n']);
  progress.complete();
}
