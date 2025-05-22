import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_flutter_carlos/core/config/status_notifier.dart';
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

  final ValueNotifier<bool> isAuthenticated = ValueNotifier(true);

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

  Future<bool> login(BuildContext context) async {
    setLoading();
    try {
      final success = await _authService.login(_email, _password);
      if (success) {
        if (context.mounted) {
          context.go(RouteConstants.listOrders);
        }
        isAuthenticated.value = true;
        setSuccess();
        return true;
      } else {
        setError('Credenciais inválidas');
        return false;
      }
    } catch (e) {
      setError('Erro inesperado: ${e.toString()}');
      return false;
    }
  }

  Future<void> logout() async {
    setLoading();
    try {
      await Future.delayed(Duration(seconds: 1));
      await _authService.logout();
      isAuthenticated.value = false;
      setSuccess();
    } catch (e) {
      setError('Erro ao sair: ${e.toString()}');
    }
  }
}
