import 'package:ProjectTemplate/extensions/string_extension.dart';

enum InteractiveBlockingEnum { SESSION_TIMEOUT, LOGGED_OUT, FORCE_UPDATE }

extension InteractiveBlockingExtension on InteractiveBlockingEnum {
  String getTitle() {
    switch (this) {
      case InteractiveBlockingEnum.SESSION_TIMEOUT:
        return "Session Timeout".localized();
        break;
      case InteractiveBlockingEnum.LOGGED_OUT:
        return "You have logged out".localized();
        break;
      case InteractiveBlockingEnum.FORCE_UPDATE:
        return "Update available".localized();
        break;
      default:
        return "";
    }
  }

  String getDetailMessage() {
    switch (this) {
      case InteractiveBlockingEnum.SESSION_TIMEOUT:
        return "You have been timed out due to inactivity. Please log in again to continue."
            .localized();
        break;
      case InteractiveBlockingEnum.LOGGED_OUT:
        return "Your account has been logged in from another device. Please log in again to continue."
            .localized();
        break;
      case InteractiveBlockingEnum.FORCE_UPDATE:
        return "A new version of the app has been released, please upgrade."
            .localized();
        break;
      default:
        return "";
    }
  }
}
