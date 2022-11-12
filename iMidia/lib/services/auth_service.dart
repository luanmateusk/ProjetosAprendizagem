import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseprofdiegocampos/pages/reset_page.dart';
import 'package:flutter/cupertino.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance; //recupera instancia do firebase
  User? usuario; //
  bool isLoading = true; //controle da mudança de telas

  AuthService() {
    //construtor
    _authCheck();
  }

  _authCheck() {
    //
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading =
          false; //já esta sendo chegado autenciação comm o usuario, então firebase já está carregado
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Esse email já está cadastrado');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }

  resetPassword(email, context) async {
    await _auth.sendPasswordResetEmail(email: email);
   
  }
}
