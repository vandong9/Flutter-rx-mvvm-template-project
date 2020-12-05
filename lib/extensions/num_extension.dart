import 'dart:math';

import 'package:intl/intl.dart';
import 'dart:io';

extension NumFormat on num {
  String thousandString() {
    var oCcy = NumberFormat("#,##0", Platform.localeName);
    return oCcy.format(this);
  }

  String toMoneyString(
      [String prefix = "\$",
      String suffix = "",
      int decimalFactionDigits = 2]) {
    var oCcy = NumberFormat("#,##0", Platform.localeName);
    oCcy.minimumFractionDigits = decimalFactionDigits;
    oCcy.maximumFractionDigits = decimalFactionDigits;
    return "$prefix${oCcy.format(this)}$suffix";
  }

  DateTime convertMillisecondToDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }

  String getDisplayOrderQuantity() {
    return this > 99 ? "99+" : this.toString();
  }

  num random([int max]) {
    var rng = new Random();
    return rng.nextInt(max ?? 1000000000);
  }
}
