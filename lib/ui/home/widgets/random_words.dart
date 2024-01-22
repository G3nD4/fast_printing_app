import 'dart:developer';

import 'package:fast_printing_app/ui/home/bloc/typing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomWordsWidget extends StatelessWidget {
  final List<String> _activeWordsRow = [];
  final List<String> _nextWordsRow = [];

  RandomWordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TypingBloc, TypingState>(builder: (context, state) {
      log(state.toString(), name: toString());
      if (state is! TypingOnState && state is! InitialState) {
        return Container();
      }
      if (state is TypingOnState) {
        _activeWordsRow.addAll(state.activeWordsRow);
        _nextWordsRow.addAll(state.nextWordsRow);
      } else if (state is InitialState) {
        _activeWordsRow.addAll(state.activeWordsRow);
        _nextWordsRow.addAll(state.nextWordsRow);
      }
      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (String word in _activeWordsRow) Text(word)],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (String word in _nextWordsRow) Text(word)],
        ),
      ]);
    });
  }
}
