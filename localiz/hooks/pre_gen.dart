import 'package:mason/mason.dart';

void run(HookContext context) {
  List<dynamic> selectedLanguages = context.vars["languages"];
  dynamic haveGeminiApi = context.vars["have_gemini_api"];
  var geminiApiKey = '';
  if (haveGeminiApi) {
    geminiApiKey = context.logger.prompt('What is your Gemini API Key ?');
  }
  if (selectedLanguages.isEmpty) {
    throw Exception("Select at least one language");
  }

  List<String> codeLanguages = [];
  if (selectedLanguages.contains("English (en)")) {
    codeLanguages.add("en");
  }
  if (selectedLanguages.contains("Arabic (ar)")) {
    codeLanguages.add("ar");
  }
  if (selectedLanguages.contains("Chinese (zh-CN)")) {
    codeLanguages.add("zh");
  }
  if (selectedLanguages.contains("Spanish (es)")) {
    codeLanguages.add("es");
  }
  if (selectedLanguages.contains("French (fr-FR)")) {
    codeLanguages.add("fr");
  }

  var defaultTemplateLang = context.logger.chooseOne(
    "Select the default language template",
    choices: codeLanguages,
    defaultValue: codeLanguages.first,
  );

  context.vars = {
    ...context.vars,
    ...{
      "withEn": selectedLanguages.contains("English (en)"),
      "withAr": selectedLanguages.contains("Arabic (ar)"),
      "withEs": selectedLanguages.contains("Spanish (es)"),
      "withZh": selectedLanguages.contains("Chinese (zh-CN)"),
      "withFr": selectedLanguages.contains("French (fr-FR)"),
      "defaultTemplateLang": defaultTemplateLang,
      "gemini_api_key": geminiApiKey
    }
  };
}
