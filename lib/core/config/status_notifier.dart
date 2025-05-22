import 'package:flutter/material.dart';

enum ProviderStatus { idle, loading, success, error, expired }

mixin StatusNotifier on ChangeNotifier {
  ProviderStatus _status = ProviderStatus.idle;
  String? _errorMessage;

  ProviderStatus get status => _status;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _status == ProviderStatus.loading;
  bool get isSuccess => _status == ProviderStatus.success;
  bool get isIdle => _status == ProviderStatus.idle;
  bool get hasError => _status == ProviderStatus.error;

  void setLoading() {
    _status = ProviderStatus.loading;
    _errorMessage = null;
    notifyListeners();
  }

  void setSuccess() {
    _status = ProviderStatus.success;
    _errorMessage = null;
    notifyListeners();
  }

  void setError(String message) {
    _status = ProviderStatus.error;
    _errorMessage = message;
    notifyListeners();
  }

  void setIdle() {
    _status = ProviderStatus.idle;
    _errorMessage = null;
    notifyListeners();
  }

  void setExpired() {
    _status = ProviderStatus.expired;
    _errorMessage = 'Sessão expirada. Faça login novamente.';
    notifyListeners();
  }
}
