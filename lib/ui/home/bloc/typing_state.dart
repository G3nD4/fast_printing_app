part of 'typing_bloc.dart';

abstract class TypingState {}

class InitialState extends TypingState {
  late final List<String> activeWordsRow;
  late final List<String> nextWordsRow;

  InitialState({
    required this.activeWordsRow,
    required this.nextWordsRow,
  });
}

class TypingOnState extends TypingState {
  late final List<String> activeWordsRow;
  late final List<String> nextWordsRow;

  TypingOnState({
    required this.activeWordsRow,
    required this.nextWordsRow,
  });
}

class TypingOffState extends TypingState {}
