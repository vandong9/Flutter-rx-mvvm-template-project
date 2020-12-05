import 'dart:math';

import 'package:ProjectTemplate/injection.dart';
import 'package:ProjectTemplate/services/localized/localized.dart';

const needleRegex = r'{#}';
const needle = '{#}';
final RegExp exp = new RegExp(needleRegex);

extension Localized on String {
  String localized() {
    final language = getIt<ILocalizedLanguage>();
    return language.textForKey(this) ?? this;
  }

  String interpolate(List l) {
    Iterable<RegExpMatch> matches = exp.allMatches(this);

    assert(l.length == matches.length);

    var i = -1;
    return this.replaceAllMapped(exp, (match) {
      print(match.group(0));
      i = i + 1;
      return '${l[i]}';
    });
  }

  String delechartAtPosition(int position) {
    return this.substring(0, position) + this.substring(position + 1);
  }

  String addCharAtPosition(String ch, int position) {
    return this.substring(0, position) + ch + this.substring(position);
  }

  String removeUnderlineBySpace() {
    if (this == null) return this;
    return this.replaceAll('_', " ");
  }

  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String randomText(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
