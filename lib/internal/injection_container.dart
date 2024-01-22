import 'package:fast_printing_app/data/repositories/db_repository.dart';
import 'package:fast_printing_app/data/repositories/words_generator_repository.dart';
import 'package:fast_printing_app/domain/service/db_interface.dart';
import 'package:fast_printing_app/domain/service/words_generator_interface.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await DatabaseSPRepository().init();
  getIt.registerLazySingleton<DatabaseInterface>(() => DatabaseSPRepository());
  getIt.registerLazySingleton<WordsGeneratorInterface>(() => WordsGenerator());
}