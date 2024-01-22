import 'package:fast_printing_app/ui/home/bloc/typing_bloc.dart';
import 'package:fast_printing_app/ui/home/widgets/entering_field.dart';
import 'package:fast_printing_app/ui/home/widgets/random_words.dart';
import 'package:fast_printing_app/ui/home/widgets/start_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TypingBloc(),
      child:  Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RandomWordsWidget(),
              const SizedBox(height: 16.0),
              EnteringFieldWidget(),
              const SizedBox(height: 16.0),
              const StartTextWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
