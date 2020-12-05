import 'package:rxdart/rxdart.dart';

extension utility on Subject {
  void addIfNotClosed(dynamic event) {
    if (!this.isClosed) {
      add(event);
    }
  }
}
