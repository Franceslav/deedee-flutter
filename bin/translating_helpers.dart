import 'dart:convert';
import 'dart:io';

Future<void> generateFileForTranslating(Iterable<String> values, String file) async {
  final output = await File(file).create(recursive: true);
  final sink = output.openWrite();
  for (final word in values) {
    sink.write(word);

    // Google Translate translate split words separately. Useful for batch translate.
    sink.writeln();
  }
}

Map<String, dynamic> readDictionary(String languageCode) {
  final rawJson = File(dictionaryFile(languageCode)).readAsStringSync();
  final json = jsonDecode(rawJson) as Map<String, dynamic>;
  return json;
}

void writeDictionary(Map<String, String> dictionary, String languageCode) {
  const encoder = JsonEncoder.withIndent('  ');
  File(dictionaryFile(languageCode)).writeAsStringSync(encoder.convert(dictionary));
}

/// Some pairs from main dictionary have not duplicates in another. This function removes those pairs.
void removeTrashFromDictionary(Map<String, dynamic> dictionary) {
  dictionary.remove('helloWorld');
  dictionary.remove('@helloWorld');
}

Map<String, String> createDictionary({
  required List<String> keys,
  required List<String> values,
  required List<String> valueTemplates,
}) {
  final dictionary = <String, String>{};
  for (var i = 0; i < keys.length; i++) {
    var value = values[i];
    value = formatByTemplate(source: value, template: valueTemplates[i]);
    dictionary[keys[i]] = value;
  }
  return dictionary;
}

String formatByTemplate({required String source, template}) {
  if (isCapitalized(template)) {
    return source[0].toUpperCase() + source.substring(1, source.length);
  } else {
    return source[0].toLowerCase() + source.substring(1, source.length);
  }
}

// We can't import useful packages with this function. It is local implementation.
bool isCapitalized(String str) => str[0] == str[0].toUpperCase();

String dictionaryFile(String languageCode) => 'lib/l10n/app_$languageCode.arb';
