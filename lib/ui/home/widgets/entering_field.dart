import 'dart:developer';

import 'package:fast_printing_app/ui/home/bloc/typing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnteringFieldWidget extends StatelessWidget {
  late final TextEditingController _controller;

  EnteringFieldWidget({super.key}) {
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    TypingBloc bloc = context.read<TypingBloc>();
    int wordIndex = 0;

    return BlocBuilder<TypingBloc, TypingState>(
      builder: (context, state) {
        log(state.toString(), name: toString());
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.64,
                child: TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    if (_controller.text.isNotEmpty &&
                        state is TypingOffState) {
                      bloc.add(StartTypingEvent());
                    }
                    if (state is TypingOnState) {
                      if (value == ' ') {
                        bool hit = _controller.text
                                .substring(0, _controller.text.length - 1) ==
                            state.activeWordsRow[wordIndex++];
                        bloc.add(CountWordEvent(hit: hit));
                      }
                    }
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<TypingBloc>().add(ResetTypingEvent());
                  _controller.text = '';
                },
                icon: const Icon(Icons.restore),
              ),
            ],
          ),
        );
      },
    );
  }
}
