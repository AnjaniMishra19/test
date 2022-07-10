class LanguageList {
  final int id;
  final String name;
  final String languageCode;

  LanguageList(this.id, this.name, this.languageCode);

  static List<LanguageList> languagelist() {
    return <LanguageList>[
      LanguageList(1, "ENGLISH", "en"),
      LanguageList(2, "HINDI", "hi"),
      LanguageList(3, "CHINESE", "zh"),
      LanguageList(4, "SPANISH", "es"),
      LanguageList(5, "ARABIC", "ar"),
      LanguageList(6, "RUSSIAN", "ru"),
      LanguageList(7, "JAPANESE", "ja"),
      LanguageList(8, "DEUTSCH", "de"),
    ];
  }
}
