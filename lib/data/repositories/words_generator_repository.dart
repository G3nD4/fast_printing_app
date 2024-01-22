import 'dart:developer';

import 'package:fast_printing_app/domain/models/locale_enum.dart';
import 'package:fast_printing_app/domain/service/words_generator_interface.dart';
import 'package:english_words/english_words.dart' as english_words;
import 'package:russian_words/russian_words.dart' as russian_words;

class WordsGenerator implements WordsGeneratorInterface {
  WordsGenerator._();
  static final WordsGenerator _generator = WordsGenerator._();
  factory WordsGenerator() => _generator;

  @override
  List<String> generateWords(
      {int amount = 5, LocaleEnum locale = LocaleEnum.en}) {
    final List<String> words = [];

    // switching locale to generate words
    switch (locale) {
      case LocaleEnum.en:
        english_words.nouns.take(amount).forEach((element) {
          words.add(element.toString());
        });
        break;
      case LocaleEnum.ru:
        russian_words.nouns.take(amount).forEach((element) {
          words.add(element.toString());
        });
        break;
    }

    // logging
    for (var word in words) {
      log(word, name: toString());
    }

    return words;
  }
}
