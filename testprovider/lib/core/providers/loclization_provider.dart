import 'package:flutter/material.dart';

class LocalizationsProvider extends ChangeNotifier{
  var language ="en";
  void changeLanguage (String value){
    if (language== value)return;
    language=value;
    notifyListeners();
  
  }
}