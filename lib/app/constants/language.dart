class LanguageConstants {
  static List<Lng> supportedLanguages = [
    Lng('Afrikaans', 'af'),
    Lng('Albanian', 'sq'),
    Lng('Amharic', 'am'),
    Lng('Arabic', 'ar'),
    Lng('Armenian', 'hy'),
    Lng('Azerbaijani', 'az'),
    Lng('Basque', 'eu'),
    Lng('Belarusian', 'be'),
    Lng('Bengali', 'bn'),
    Lng('Bosnian', 'bs'),
    Lng('Bulgarian', 'bg'),
    Lng('Catalan', 'ca'),
    Lng('Cebuano', 'ceb'),
    Lng('Chinese (Simplified)', 'zh-CN'),
    Lng('Chinese (Traditional)', 'zh-TW'),
    Lng('Corsican', 'co'),
    Lng('Croatian', 'hr'),
    Lng('Czech', 'cs'),
    Lng('Danish', 'da'),
    Lng('Dutch', 'nl'),
    Lng('English', 'en'),
    Lng('Esperanto', 'eo'),
    Lng('Estonian', 'et'),
    Lng('Filipino', 'fil'),
    Lng('Finnish', 'fi'),
    Lng('French', 'fr'),
    Lng('Frisian', 'fy'),
    Lng('Galician', 'gl'),
    Lng('Georgian', 'ka'),
    Lng('German', 'de'),
    Lng('Greek', 'el'),
    Lng('Gujarati', 'gu'),
    Lng('Haitian Creole', 'ht'),
    Lng('Hausa', 'ha'),
    Lng('Hebrew', 'he'),
    Lng('Hindi', 'hi'),
    Lng('Hungarian', 'hu'),
    Lng('Icelandic', 'is'),
    Lng('Igbo', 'ig'),
    Lng('Indonesian', 'id'),
    Lng('Irish', 'ga'),
    Lng('Italian', 'it'),
    Lng('Japanese', 'ja'),
    Lng('Javanese', 'jv'),
    Lng('Kannada', 'kn'),
    Lng('Kazakh', 'kk'),
    Lng('Khmer', 'km'),
    Lng('Korean', 'ko'),
    Lng('Kurdish', 'ku'),
    Lng('Lao', 'lo'),
    Lng('Latin', 'la'),
    Lng('Latvian', 'lv'),
    Lng('Lithuanian', 'lt'),
    Lng('Macedonian', 'mk'),
    Lng('Malagasy', 'mg'),
    Lng('Malay', 'ms'),
    Lng('Malayalam', 'ml'),
    Lng('Maltese', 'mt'),
    Lng('Maori', 'mi'),
    Lng('Marathi', 'mr'),
    Lng('Mongolian', 'mn'),
    Lng('Nepali', 'ne'),
    Lng('Norwegian', 'no'),
    Lng('Pashto', 'ps'),
    Lng('Persian', 'fa'),
    Lng('Polish', 'pl'),
    Lng('Portuguese', 'pt'),
    Lng('Punjabi', 'pa'),
    Lng('Romanian', 'ro'),
    Lng('Russian', 'ru'),
    Lng('Samoan', 'sm'),
    Lng('Scots Gaelic', 'gd'),
    Lng('Serbian', 'sr'),
    Lng('Sesotho', 'st'),
    Lng('Shona', 'sn'),
    Lng('Sindhi', 'sd'),
    Lng('Sinhala', 'si'),
    Lng('Slovak', 'sk'),
    Lng('Slovenian', 'sl'),
    Lng('Somali', 'so'),
    Lng('Spanish', 'es'),
    Lng('Sundanese', 'su'),
    Lng('Swahili', 'sw'),
    Lng('Swedish', 'sv'),
    Lng('Tamil', 'ta'),
    Lng('Telugu', 'te'),
    Lng('Thai', 'th'),
    Lng('Turkish', 'tr'),
    Lng('Ukrainian', 'uk'),
    Lng('Urdu', 'ur'),
    Lng('Uzbek', 'uz'),
    Lng('Vietnamese', 'vi'),
    Lng('Welsh', 'cy'),
    Lng('Xhosa', 'xh'),
    Lng('Yiddish', 'yi'),
    Lng('Yoruba', 'yo'),
    Lng('Zulu', 'zu')
  ];
}

class Lng {
  String name;
  String code;

  Lng(this.name, this.code);

  Lng? getObjByName(String name) {
    if (this.name == name) {
      return this;
    }
    return null;
  }
}
