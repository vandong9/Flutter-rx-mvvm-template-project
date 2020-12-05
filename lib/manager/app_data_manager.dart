import 'dart:async';
import 'package:ProjectTemplate/res/define.dart';
import 'package:ProjectTemplate/services/local_storage/reference_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

// Note: UserDataManger have life long as app so may no need to dispose streams.
@singleton
class AppDataManager {
  final IAppDataManagerRepository _appDataManagerRepository =
      AppDataManagerRepository();

  AppDataManager() {
    loadData();
  }

  // Fetch token and user from storage
  void loadData() async {
    await PreferenceProvider.load();
  }

  // Note: data need to be clear should be added to this function
  void clearAll() {
    updateToken(null);
  }
}

// Token
extension TokenManger on AppDataManager {
  static final BehaviorSubject<String> _tokenBehavior =
      BehaviorSubject<String>();
  String get currentToken => _tokenBehavior.stream.value;
  Stream<String> get currentUserStream => _tokenBehavior.stream;

  void updateToken(String token) {
    _tokenBehavior.sink.add(token);
  }
}

///
/// AppDataManagerRepository
///

abstract class IAppDataManagerRepository {
  Future saveSignedUser(String userJsonString);
  Future<String> getStorageUserPin();
  Future saveUserPin(String token);
}

class AppDataManagerRepository implements IAppDataManagerRepository {
  Future saveSignedUser(String userJsonString) {
    return PreferenceProvider.setString(KeySigninUserStoraged, userJsonString);
  }

  Future<String> getStorageUserPin() async {
    return PreferenceProvider.getString(KeyUserPinStoraged);
  }

  Future saveUserPin(String pin) {
    return PreferenceProvider.setString(KeyUserPinStoraged, pin);
  }
}
