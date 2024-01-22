part of 'typing_bloc.dart';

abstract class TypingEvent {}

class StartTypingEvent extends TypingEvent {}

class FinishTypingEvent extends TypingEvent {}

class ResetTypingEvent extends TypingEvent {}

class CountWordEvent extends TypingEvent {
  late final bool hit;

  CountWordEvent({required this.hit});
}

class GetMoreWordsEvent extends TypingEvent {}