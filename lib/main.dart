import 'dart:async';
import 'package:flutter/material.dart';
import 'package:translate/app_bar.dart';
import 'package:translate/ui/language_selection.dart';
import 'package:translate/ui/text_input_field.dart';
import 'package:translate/models/language.dart';
import 'package:translate/data/languages.dart';
import 'package:translate/models/translation.dart';
import 'package:translate/ui/blue_card.dart';
import 'package:translate/data/fetcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Translate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Language fromLang = languages[0];
  Language toLang = languages[1];

  String _currentText = "";
  List<Translation> _translations = new List<Translation>();

  void translate(String str) {
    setState(() => _currentText = str);
    Future<Translation> future =
        FetchTranslation(str, this.fromLang.textName, this.toLang.textName);

    future.then((tl) {
      setState(() {
        _translations.insert(0, tl);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          LanguageSelection(
              fromLang: this.fromLang,
              toLang: this.toLang,
              onButtonClick: () => translate(_currentText),
              onLanguageChange: (String part, Language val) {
                setState(() {
                  if (part == "from") {
                    this.fromLang = val;
                  } else {
                    this.toLang = val;
                  }
                });
              }),
          TextInputField(
            onTextChange: (String newText) => _currentText = newText,
          ),
          Text("Translations",
              style: TextStyle(
                fontSize: 24.0,
              )),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _translations.length,
                  itemBuilder: (BuildContext context, int index) {
                    Translation tl = _translations[index];
                    return Container(
                      child: ListTile(
                        key: Key(index.toString()),
                        title: Text(tl.translatedText),
                        subtitle: Text(tl.originalText),
                        trailing: Text(tl.translatedLang),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
