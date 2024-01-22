import 'package:fast_printing_app/domain/models/locale_enum.dart';

abstract class WordsGeneratorInterface {
  List<String> generateWords({int amount = 5, LocaleEnum locale = LocaleEnum.en});
}