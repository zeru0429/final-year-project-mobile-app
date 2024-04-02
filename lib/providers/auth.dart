import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool islogin = false;

  void login() {
    islogin = true;
    notifyListeners();
  }

  void logout() {
    islogin = false;
    notifyListeners();
  }
}
