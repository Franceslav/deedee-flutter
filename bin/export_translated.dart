import 'translating_helpers.dart';

/// Creates file with words for translating.
void main() async {
  const fileWithWordsForTranslating = 'bin/assets/for_translating.txt';
  const sourceLanguageCode = 'en';

  final source = readDictionary(sourceLanguageCode);
  removeTrashFromDictionary(source);
  generateFileForTranslating(source.keys, fileWithWordsForTranslating);
}
