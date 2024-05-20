import 'dart:io';

class ConfigurePubspec {
  Future<void> setup() async {
    var pubspecFile = File('pubspec.yaml');
    var currentPubspecConfig = await pubspecFile.readAsString();
    if (currentPubspecConfig.contains('generate: true')) {
      return;
    }
    String materialDesignConfig = "uses-material-design: true";
    var index = currentPubspecConfig.indexOf(materialDesignConfig);
    await pubspecFile
        .writeAsString('''${currentPubspecConfig.substring(0, index)}
  generate: true
  ${currentPubspecConfig.substring(index, currentPubspecConfig.length)}
  ''');
  }
}
