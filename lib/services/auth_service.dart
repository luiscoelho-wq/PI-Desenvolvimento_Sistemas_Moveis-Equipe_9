import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/app_user.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? currentUser;

  AppUser? get user => currentUser;

  Future<void> login(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    currentUser = AppUser(
      id: credential.user!.uid,
      name: credential.user!.displayName ?? email.split("@")[0],
      email: credential.user!.email!,
      cpf: null,
    );

    notifyListeners();
  }

  Future<void> register(String email, String password, String cpf) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user!.updateDisplayName(email.split("@")[0]);

    currentUser = AppUser(
      id: credential.user!.uid,
      name: email.split("@")[0],
      email: email,
      cpf: cpf,
    );

    notifyListeners();
  }

  Future<void> logout() async {
    await _auth.signOut();
    currentUser = null;
    notifyListeners();
  }

  bool get isLogged => currentUser != null;
}