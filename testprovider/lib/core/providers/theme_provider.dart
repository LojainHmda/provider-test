import 'package:flutter/material.dart';
import 'package:testprovider/core/utils/app_theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode theme = ThemeMode.dark;
  void changeTheme (ThemeMode value){
    if (theme== value)return;
    theme =value;
    notifyListeners();
  }
}