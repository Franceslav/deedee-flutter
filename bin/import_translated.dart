import 'dart:io';

import 'translating_helpers.dart';

/// Generate dictionary from file with translated words.
void main() async {
  const fileWithTranslated = 'bin/assets/translated.txt';
  const sourceLanguageCode = 'en';
  const targetLanguageCode = 'da';

  final source = readDictionary(sourceLanguageCode);
  final translated = File(fileWithTranslated).readAsLinesSync();
  removeTrashFromDictionary(source);
  final dictionary = createDictionary(
    keys: source.keys.toList(),
    values: translated,
    valueTemplates: source.values.cast<String>().toList(),
  );
  writeDictionary(dictionary, targetLanguageCode);
}
