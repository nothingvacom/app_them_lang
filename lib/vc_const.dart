import 'package:flutter/material.dart';
class VcConst{
  // property Language
  static const List<String> _listLanguages = ['vi','en'];
  static const List<String> _titleLanguages = ['Việt Nam','English'];
  static final List<IconData> _iconsLanguages = [Icons.outlined_flag,Icons.language];

  // Get language
  static List<String> get listLanguages => _listLanguages;
  static List<String> get titleLanguages => _titleLanguages;
  static List<IconData> get iconsLanguages => _iconsLanguages;

  // Theme
  static final ThemeData _lightTheme = new ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.light,
    accentColor: Colors.purpleAccent[100],
    primaryColor: Colors.white,
    primaryColorLight: Colors.purple[700],
    textSelectionHandleColor: Colors.purple[700],
    dividerColor: Colors.grey[200],
    bottomAppBarColor: Colors.grey[200],
    buttonColor: Colors.purple[700],
    iconTheme: new IconThemeData(color: Colors.white),
    primaryIconTheme: new IconThemeData(color: Colors.black),
    accentIconTheme: new IconThemeData(color: Colors.purple[700]),
    disabledColor: Colors.grey[500],
  );

  static final ThemeData _darkTheme = new ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.dark,
    accentColor: Colors.deepPurpleAccent[100],
    primaryColor: Color.fromRGBO(50, 50, 57, 1.0),
    primaryColorLight: Colors.deepPurpleAccent[100],
    textSelectionHandleColor: Colors.deepPurpleAccent[100],
    buttonColor: Colors.deepPurpleAccent[100],
    iconTheme: new IconThemeData(color: Colors.white),
    accentIconTheme: new IconThemeData(color: Colors.deepPurpleAccent[100]),
    cardColor: Color.fromRGBO(55, 55, 55, 1.0),
    dividerColor: Color.fromRGBO(60, 60, 60, 1.0),
    bottomAppBarColor: Colors.black26,
  );

  static final List<ThemeData> _listThemes=[
    _lightTheme,
    _darkTheme
  ];
  static final List<String> _listThemeNames=[
    "Light",
    "Dark"
  ];
  static final List<Color> _listThemeColors=[
    Colors.white,
    Colors.black54
  ];

  static final List<IconData> _listThemeIcons=[
    Icons.brightness_7,
    Icons.brightness_3
  ];

  static List<ThemeData> get listThemes => _listThemes;
  static List<String> get listThemeNames => _listThemeNames;
  static List<Color> get listThemeColors => _listThemeColors;
  static List<IconData> get listThemeIcons => _listThemeIcons;

}

