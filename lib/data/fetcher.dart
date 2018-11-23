import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translate/models/translation.dart';

Future<Translation> fetchTranslation(
    String text, String fromLang, String toLang) async {
  if (text == "") return null;
  print("translating text " + text);
  String fromLangStr = fromLang;
  String toLangStr = toLang;
  String query = text;
  String host = "http://localhost:3000";

  String url = "$host/?q=$query&fl=$fromLangStr&tl=$toLangStr";

  http.Client client = new http.Client();
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  http.Response resp = await client.get(url, headers: headers);
  Map<String, dynamic> jsonParsed = json.decode(resp.body);
  Translation tl = Translation.fromJSON(jsonParsed);

  return Future.value(tl);
  // _translationController.add(Translation.fromJSON(jsonParsed));
}
