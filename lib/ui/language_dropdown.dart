import 'package:flutter/material.dart';
import 'package:translate/models/language.dart';
import 'package:translate/types.dart';

class LanguageDropdown extends StatelessWidget {
  LanguageDropdown(
      {@required this.onDropdown,
      @required this.choices,
      this.currentSelection});

  final LanguageSelectCallback onDropdown;
  List<String> choices;
  String currentSelection;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(24.0),
        child: Row(children: <Widget>[
          // ListTile(
          //   title: const Text("Language"),
          //   trailing:
          DropdownButton<String>(
            value: currentSelection,
            onChanged: onDropdown,
            items: choices.map<DropdownMenuItem<String>>((String val) {
              return DropdownMenuItem<String>(value: val, child: Text(val));
            }).toList(),
          ),
          // ),
        ]));
  }
}
