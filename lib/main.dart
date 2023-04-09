import 'package:flutter/material.dart';
import 'package:input_widgets/home_page.dart';
import 'package:input_widgets/text_field.dart';
import 'package:input_widgets/text_form_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        '/textfield': (context) => const TextFieldPage(),
        '/textformfield': (context) => const TextFormFieldPage()
      },
    );
  }
}
