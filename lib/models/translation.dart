class Translation {
  String originalText, translatedText;
  String originalLang, translatedLang;

  Translation(
      {this.originalText,
      this.translatedText,
      this.originalLang,
      this.translatedLang});

  factory Translation.fromJSON(Map<String, dynamic> parsedJson) {
    print(parsedJson);
    return new Translation(
      originalLang: parsedJson["from"]["language"]["iso"],
      originalText: parsedJson["query"],
      translatedText: parsedJson["text"],
      translatedLang: parsedJson["to"],
    );
  }
}
