import 'package:findjob/constants/app_constants.dart';
import 'package:findjob/controllers/exports.dart';
import 'package:findjob/services/helpers/auth_helper.dart';
import 'package:findjob/views/screens/home/homepage.dart';
import 'package:findjob/views/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  bool? _entrypoint;
  bool get entrypoint => _entrypoint ?? false;
  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  bool? _loggedIn;
  bool get loggedIn => _loggedIn ?? false;
  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  bool _loader = false;

  bool get loader => _loader;

  set loader(bool newValue) {
    _loader = newValue;
    notifyListeners();
  }

  login(String model, ZoomNotifier zoomNotifier) {
    AuthHelper.login(model).then((response) {
      if (response == true) {
        loader = false;
        zoomNotifier.currentIndex = 0;
        Get.to(() => MainScreen());
      } else {
        loader = false;
        Get.snackbar(
          'Failes to Sign In',
          'Please check your credentials',
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: Icon(Icons.add_alert),
        );
      }
    });
  }

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    entrypoint = prefs.getBool('entrypoint') ?? false;
    loggedIn = prefs.getBool('loggedIn') ?? false;
    username = prefs.getString('username') ?? '';
    userUid = prefs.getString('uid') ?? '';
    profile = prefs.getString('profile') ?? '';
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('loggedIn', false);
    await prefs.remove('token');
  }
}
