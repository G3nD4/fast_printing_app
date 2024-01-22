import 'dart:developer';

import 'package:fast_printing_app/ui/home/bloc/typing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartTextWidget extends StatelessWidget {
  const StartTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TypingBloc, TypingState>(
      builder: (context, state) {
        log(state.toString(), name: toString());
        if (state is TypingOffState) {
          return const Text('Start entering to start');
        }
        return Container();
      },
    );
  }
}