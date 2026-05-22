import 'package:flutter/foundation.dart';
import 'package:pi2/services/auth_service.dart';
import 'package:pi2/models/app_user.dart';

class FakeAuthService extends ChangeNotifier implements AuthService {
  AppUser? _currentUser; // 👈 único campo real

  @override
  AppUser? get currentUser => _currentUser;

  @override
  set currentUser(AppUser? value) {
    _currentUser = value;
    notifyListeners();
  }

  @override
  AppUser? get user => _currentUser;

  @override
  bool get isLogged => _currentUser != null;

  @override
  Future<void> login(String email, String password) async {
    _currentUser = AppUser(
      id: '1',
      name: 'Test User',
      email: email,
      cpf: null,
    );
    notifyListeners();
  }

  @override
  Future<void> register(String email, String password, String cpf) async {
    _currentUser = AppUser(
      id: '1',
      name: 'Test User',
      email: email,
      cpf: cpf,
    );
    notifyListeners();
  }

  @override
  Future<void> logout() async {
    _currentUser = null;
    notifyListeners();
  }
}