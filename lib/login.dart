import 'package:app_them_lang/all_translations.dart';
import 'package:app_them_lang/vc_const.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  Login({Key key,this.idxTheme,this.themeMode,this.toggleTheme,this.idxLang,this.langMode,this.toggleLang});
  final int idxTheme;
  final String themeMode;
  final Function toggleTheme;
  final int idxLang;
  final String langMode;
  final Function toggleLang;

  @override
  _LoginState createState()=>_LoginState();
}

class _LoginState extends State<Login>{

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> _dropDownThemes=VcConst.listThemeNames.map(
        (String nameTheme)=>PopupMenuItem(
        value: nameTheme,
        child: Row(
          children: <Widget>[
            Icon(VcConst.listThemeIcons[VcConst.listThemeNames.indexOf(nameTheme)],color: Theme.of(context).buttonColor),
            Text(nameTheme,style: Theme.of(context)
              .textTheme
              .body2
              .apply(color: Theme.of(context).buttonColor))
          ],
        )
      )
    ).toList();

    final List<PopupMenuItem<String>> _dropDownLangs=VcConst.titleLanguages.map(
            (String nameLang)=>PopupMenuItem(
            value: nameLang,
            child: Row(
              children: <Widget>[
                Icon(VcConst.iconsLanguages[VcConst.titleLanguages.indexOf(nameLang)],color: Theme.of(context).buttonColor),
                Text(nameLang,style: Theme.of(context)
                    .textTheme
                    .body2
                    .apply(color: Theme.of(context).buttonColor))
              ],
            )
        )
    ).toList();

    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Demo change Theme"),
      ),
      body: Center(
        child: Text(allTranslations.text('title')),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                PopupMenuButton(
                    onSelected: (String newTheme)=>widget.toggleTheme(newTheme),
                    icon: Icon(VcConst.listThemeIcons[widget.idxTheme],color: Theme.of(context).buttonColor),
                    itemBuilder: (BuildContext context)=>_dropDownThemes
                ),
                Text(VcConst.listThemeNames[widget.idxTheme],style: Theme.of(context)
                    .textTheme
                    .body2
                    .apply(color: Theme.of(context).buttonColor))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(VcConst.titleLanguages[widget.idxLang],style: Theme.of(context)
                    .textTheme
                    .body2
                    .apply(color: Theme.of(context).buttonColor)),
                PopupMenuButton(
                    onSelected: (String newLang)=>widget.toggleLang(newLang),
                    icon: Icon(VcConst.iconsLanguages[widget.idxLang],color: Theme.of(context).buttonColor),
                    itemBuilder: (BuildContext context)=>_dropDownLangs
                ),
              ],
            )
          )
        ],
      ),
    );
  }

}