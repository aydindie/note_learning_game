// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeData themeData = ThemeData.light();

  @observable
  bool isDarkMode = false;

  @action
  void toggleTheme() {
    isDarkMode = !isDarkMode;
    themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();
    _saveThemePreference(isDarkMode);
  }

  Future<void> _saveThemePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
  }

  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false;
    themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();
  }

  _ThemeStore() {
    _loadThemePreference();
  }
}
