import 'package:flutter/material.dart';
import 'package:input_widgets/checkbox_slider_radio_switch_page.dart';
import 'package:input_widgets/date_page.dart';
import 'package:input_widgets/home_page.dart';
import 'package:input_widgets/stepper_page.dart';
import 'package:input_widgets/text_field.dart';
import 'package:input_widgets/text_form_field.dart';
import 'package:input_widgets/todo_list_page.dart';

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
        '/textformfield': (context) => const TextFormFieldPage(),
        '/other': (context) => const CheckboxSliderRadioSwitchPage(),
        '/date': (context) => const DatePage(),
        '/stepper': (context) => const StepperPage(),
        '/todo': (context) => const TodoListPage(),
      },
    );
  }
}
