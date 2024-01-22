import 'package:fast_printing_app/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fast_printing_app/internal/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup(); // registering dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
