import 'dart:convert';
import 'dart:io';

const pathToAppEnArb = './lib/l10n/app_en.arb';
const pathToTargetArb = './lib/l10n/app_nl.arb';

void main() async {
  String appEnArbFile = File(pathToAppEnArb).readAsStringSync();
  Map<String, dynamic> v = jsonDecode(appEnArbFile) as Map<String, dynamic>;
  var outFile = File('out.txt').openWrite(mode: FileMode.write);
  outFile.writeAll(v.values.toList(), '\n');

  if (!File('in.txt').existsSync()) {
    print("File cannot be found. You must create it");
    return ;
  }

  var newTranslationFile = File(pathToTargetArb).openWrite();
  List<String> contentValues = File('in.txt').readAsLinesSync();

  for (var i = 0; i < v.entries.length; i++) {
    String key = v.keys.toList()[i];
    v[key] = contentValues[i];
  }

  newTranslationFile.write(const JsonEncoder.withIndent('  ').convert(v));
}