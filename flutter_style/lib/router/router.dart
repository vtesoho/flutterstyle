import 'package:flutter/material.dart';

class Router{
  PageController _homeBottomTabController;

  static Router _instance;
  factory Router() => _getInstance();
  Router._internal() {}
  static Router _getInstance() {
    if (_instance == null) {
      _instance = Router._internal();
    }
    return _instance;
  }

  setHomeBottomTabController({PageController setController}) {
    if (_homeBottomTabController == null) {
      _homeBottomTabController = setController;
    }
  }

  

  
}