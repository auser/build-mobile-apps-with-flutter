import 'package:flutter/material.dart';
import 'package:translate/ui/language_dropdown.dart';
import 'package:translate/data/languages.dart';
import 'package:translate/models/language.dart';
import 'package:translate/types.dart';

class LanguageSelection extends StatefulWidget {
  LanguageSelection(
      {this.TextInput,
      @required this.onLanguageChange,
      @required this.onButtonClick,
      this.fromLang,
      this.toLang});
  final Widget TextInput;
  final LanguageSelectedCallback onLanguageChange;
  final VoidCallback onButtonClick;
  Language fromLang;
  Language toLang;

  @override
  LanguageSelectionState createState() => new LanguageSelectionState();
}

class LanguageSelectionState extends State<LanguageSelection> {
  Language fromLang;
  Language toLang;

  LanguageSelectionState();

  @override
  void initState() {
    super.initState();

    fromLang = widget.fromLang;
    toLang = widget.toLang;
  }

  void setLanguage(String part, String val) {
    Language lang = languages.firstWhere((l) => l.name == val);
    widget.onLanguageChange(part, lang);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<String> languageNames = languages.map((Language l) => l.name).toList();
    ThemeData theme = Theme.of(context);

    return Container(
        decoration: BoxDecoration(
            color: Colors.green[10],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey[100], Colors.grey[300]],
              stops: [0.0, 1.0],
            )),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              LanguageDropdown(
                onDropdown: (String val) => setLanguage("from", val),
                choices: languageNames,
                currentSelection: widget.fromLang.name,
              ),
              Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(32.5)),
                  color: Colors.blueAccent,
                ),
                child: FlatButton(
                  onPressed: widget.onButtonClick,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  disabledColor: theme.accentColor,
                ),
              ),
              LanguageDropdown(
                onDropdown: (String val) => setLanguage("to", val),
                choices: languageNames,
                currentSelection: widget.toLang.name,
              ),
            ],
          )
        ]));
  }
}
