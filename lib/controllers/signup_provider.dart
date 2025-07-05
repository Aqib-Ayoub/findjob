import 'package:flutter/material.dart';

class SignUpNotifier extends ChangeNotifier {
  // trigger to hide and unhide the password
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool obsecure) {
    _obscureText = obsecure;
    notifyListeners();
  }

  // triggered when the login button is clicked to show the loading widget
  bool _loader = false;

  bool get loader => _loader;

  set loader(bool newValue) {
    _loader = newValue;
    notifyListeners();
  }

  // triggered when the fist time when user login to be prompted to the update profile page
  bool _firstTime = false;

  bool get firstTime => _firstTime;

  set firstTime(bool newValue) {
    _firstTime = newValue;
    notifyListeners();
  }

  final signupFormKey = GlobalKey<FormState>();

  bool passwordValidator(String password) {
    if (password.isEmpty) return false;
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  bool validateAndSave() {
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
