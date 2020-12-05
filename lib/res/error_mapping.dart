import 'package:injectable/injectable.dart';
import 'package:ProjectTemplate/extensions/string_extension.dart';

@singleton
class ErrorMapping {
  Map<String, String> _errors = {};

  String getError(String statusCode, {prefixNumber}) {
    return _errors[statusCode] ?? statusCode.removeUnderlineBySpace();
  }

  Future<void> initErrors() async {
    _errors.putIfAbsent(
        "user_not_exist", () => "User ID is invalid.".localized());
    _errors.putIfAbsent("incorrect_login_password",
        () => "You have entered an invalid PIN. Attempted {#}/5.".localized());
    _errors.putIfAbsent(
        "account_lockout",
        () => "Your account has been locked. Please contact your Administrator."
            .localized());
    _errors.putIfAbsent(
        "permission_denied",
        () =>
            "You are not authorized to access this terminal. Please check and login again."
                .localized());
    _errors.putIfAbsent("account_deactivated",
        () => "Your merchant has been deactivated.".localized());
    _errors.putIfAbsent("qrcode_invalid_with_merchant",
        () => "The order is not from your store.".localized());
    _errors.putIfAbsent(
        "qrcode_not_found", () => "This is invalid QR code.".localized());
    _errors.putIfAbsent("qrcode_invalid_with_orderid",
        () => "The order does not match to customer.".localized());
    _errors.putIfAbsent(
        "order_not_existed", () => "This is invalid order.".localized());
    _errors.putIfAbsent("order_completed",
        () => "This order is already completed.".localized());
  }
}
