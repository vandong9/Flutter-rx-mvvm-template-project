import 'package:ProjectTemplate/config/configure_environment.dart';
import 'package:logger/logger.dart';

class AppLog {
  static final _logger = Logger();

  static bool get _isDisableLog {
    return FlavorConfig.isProduction();
  }

  static v(dynamic message, [dynamic error, StackTrace stackTrace]) {
    if (_isDisableLog) return;
    _logger.v(message, error, stackTrace);
  }

  static d(dynamic message, [dynamic error, StackTrace stackTrace]) {
    if (_isDisableLog) return;
    _logger.d(message, error, stackTrace);
  }

  static i(dynamic message, [dynamic error, StackTrace stackTrace]) {
    if (_isDisableLog) return;
    _logger.i(message, error, stackTrace);
  }

  static w(dynamic message, [dynamic error, StackTrace stackTrace]) {
    if (_isDisableLog) return;
    _logger.w(message, error, stackTrace);
  }

  static e(dynamic message, [dynamic error, StackTrace stackTrace]) {
    if (_isDisableLog) return;
    _logger.e(message, error, stackTrace);
  }

  static wtf(dynamic message, [dynamic error, StackTrace stackTrace]) {
    if (_isDisableLog) return;
    _logger.wtf(message, error, stackTrace);
  }
}
