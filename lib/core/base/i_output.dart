import 'package:rxdart/subjects.dart';

abstract class IOutput {
  final offline = PublishSubject<bool>();
  final loading = PublishSubject<bool>();
  final alert = PublishSubject<String>();

  void dispose() {
    offline.close();
    loading.close();
    alert.close();
  }
}
