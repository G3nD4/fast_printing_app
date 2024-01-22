import 'package:fast_printing_app/domain/models/models.dart';
import 'package:fast_printing_app/domain/service/db_interface.dart';
import 'package:fast_printing_app/domain/service/words_generator_interface.dart';
import 'package:fast_printing_app/internal/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'typing_event.dart';
part 'typing_state.dart';

class TypingBloc extends Bloc<TypingEvent, TypingState> {
  static const amountOfWords = 5; // TODO: calculate it with respect to screen width

  late Trial _trial;
  final DatabaseInterface _database = getIt.get<DatabaseInterface>();
  static final List<String> _activeWordsRow = getIt.get<WordsGeneratorInterface>().generateWords(amount: amountOfWords);
  static final List<String> _nextWordsRow = getIt.get<WordsGeneratorInterface>().generateWords(amount: amountOfWords);
    
  TypingBloc() : super(InitialState(
    activeWordsRow: _activeWordsRow,
    nextWordsRow: _nextWordsRow,
  )) {
    on<StartTypingEvent>(_startTyping);
    on<FinishTypingEvent>(_finishTyping);
    on<CountWordEvent>(_countWord);
    on<ResetTypingEvent>(_resetTyping);
    
  }
  _resetTyping(event, emit) {
    // TODO: reset stopwatch
    emit(InitialState(
      activeWordsRow: _activeWordsRow,
      nextWordsRow: _nextWordsRow,
    ));
  }

  _startTyping(event, emit) {
    _trial = Trial(
      timeStamp: DateTime.now(),
      amountOfWords: 0,
      hits: 0,
      misses: 0,
      id: _database.getAvailableId(),
    );
    emit(TypingOnState(
      activeWordsRow: _activeWordsRow,
      nextWordsRow: _nextWordsRow,
    ));
  }

  _finishTyping(event, emit) {
    emit(TypingOffState());
    // _database.insert(_database.getAvailableId(), _trial.toJson());
  }

  _countWord(CountWordEvent event, emit) {
    _trial.amountOfWords += 1;
    if (event.hit) {
      _trial.hits += 1;
    } else {
      _trial.misses += 1;
    }
  }
}
