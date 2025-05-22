import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_flutter_carlos/core/config/auth_manager.dart';
import 'package:sw_flutter_carlos/core/config/status_notifier.dart';
import 'package:sw_flutter_carlos/core/exceptions/api_exception.dart';
import 'package:sw_flutter_carlos/core/routes/route_constants.dart';
import 'package:sw_flutter_carlos/features/auth/service/auth_service.dart';

class LoginProvider extends ChangeNotifier with StatusNotifier {
  final AuthService _authService;
  LoginProvider(this._authService);

  String _email = '';
  String _password = '';
  bool _obscurePassword = true;

  String get email => _email;
  String get password => _password;
  bool get obscurePassword => _obscurePassword;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    setLoading();
    try {
      final success = await _authService.login(_email, _password);
      if (success) {
        if (context.mounted) {
          context.pushReplacement(RouteConstants.listOrders);
        }
        setSuccess();
      } else {
        setError('Credenciais inválidas');
      }
    } on ApiException catch (e) {
      setError(e.message);
    } catch (e) {
      setError('Erro inesperado: ${e.toString()}');
    }
  }

  Future<void> logout(BuildContext context) async {
    setLoading();
    try {
      await _authService.logout();
      setSuccess();
      AuthManager.onLogout?.call();
    } catch (e) {
      setError('Erro ao sair: ${e.toString()}');
    }
  }
}
