import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final removeJson = context.vars["remove_json"];
  if (removeJson == true) {
    var progress = context.logger.progress("Deleting json file");
    await Process.run(
      'rm',
      [
        '${Directory.current.path}/${context.vars['class_name']}.json',
      ],
    );
    progress.complete('json file deleted');
  }
  exit(0);
}
