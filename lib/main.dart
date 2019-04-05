import 'package:app_them_lang/login.dart';
import 'package:app_them_lang/vc_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'all_translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future main() async {
  await allTranslations.init();
  String themeMode = VcConst.listThemeNames[0];
  String langMode = VcConst.titleLanguages[0];
  runApp(VacomApp(themeMode:themeMode,langMode:langMode));
}

class VacomApp extends StatefulWidget {
  final String themeMode;
  final String langMode;
  VacomApp({Key key, String this.themeMode,this.langMode});

  @override
  _VacomAppState createState() => _VacomAppState();
}

class _VacomAppState extends State<VacomApp>{
  int idxTheme;
  String themeMode;
  int idxLang;
  String langMode;

  toggleTheme(String newTheme) {
    int idxThemeNew=VcConst.listThemeNames.indexOf(newTheme);
    if (idxTheme!=idxThemeNew) _toggleTheme(idxThemeNew);
  }
  _toggleTheme(int idxThemeNew){
    setState(() {
      this.idxTheme = idxThemeNew;
    });
    setNavBarColor();
  }
  toggleLang(String newLang){
    int idxLangNew=VcConst.titleLanguages.indexOf(newLang);
    if (idxLang!=idxLangNew) _toggleLang(idxLangNew);
  }
  _toggleLang(int idxLangNew) async {
    await allTranslations.setNewLanguage(VcConst.listLanguages[idxLangNew]);
    setState(() {
      this.idxLang = idxLangNew;
    });
  }
  setNavBarColor() async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor:VcConst.listThemes[idxTheme].primaryColor));
  }

  _onLocaleChanged() async {
    // do anything you need to do if the language changes
    print('Language has been changed to: ${allTranslations.currentLanguage}');
  }

  @override
  void initState() {
    super.initState();
    themeMode = widget.themeMode ?? VcConst.listThemeNames[0];
    idxTheme=idxTheme??VcConst.listThemeNames.indexOf(themeMode);

    langMode = widget.langMode ?? VcConst.titleLanguages[0];
    idxLang=idxLang??VcConst.titleLanguages.indexOf(langMode);
    allTranslations.onLocaleChangedCallback = _onLocaleChanged;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: VcConst.listThemes[idxTheme].primaryColor,
      title: "VACOM",
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: allTranslations.supportedLocales(),
      home: Login(
        idxTheme:idxTheme,
        themeMode:themeMode,
        toggleTheme:toggleTheme,
        idxLang:idxLang,
        langMode:langMode,
        toggleLang:toggleLang
      ),
      theme: VcConst.listThemes[idxTheme],
    );
  }
}


