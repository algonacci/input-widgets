import 'package:flutter/material.dart';

class CheckboxSliderRadioSwitchPage extends StatefulWidget {
  const CheckboxSliderRadioSwitchPage({super.key});

  @override
  State<CheckboxSliderRadioSwitchPage> createState() =>
      _CheckboxSliderRadioSwitchPageState();
}

class _CheckboxSliderRadioSwitchPageState
    extends State<CheckboxSliderRadioSwitchPage> {
  bool checkboxState = false;
  String? day;
  bool switchState = false;
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckboxSliderRadioSwitchPage'),
      ),
      body: ListView(
        children: [
          CheckboxListTile(
            title: const Text('Title'),
            subtitle: const Text('Subtitle'),
            value: checkboxState,
            selected: true,
            onChanged: (selected) {
              setState(() {
                checkboxState = selected!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Monday'),
            value: 'Monday',
            groupValue: day,
            onChanged: (value) {
              setState(() {
                day = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Tuesday'),
            value: 'Tuesday',
            groupValue: day,
            onChanged: (value) {
              setState(() {
                day = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Wednesday'),
            value: 'Wednesday',
            groupValue: day,
            onChanged: (value) {
              setState(() {
                day = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Thursday'),
            subtitle: const Text('LIBUR'),
            value: 'Thursday',
            groupValue: day,
            onChanged: (value) {
              setState(() {
                day = value!;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Switch'),
            value: switchState,
            onChanged: (value) {
              setState(
                () {
                  switchState = value;
                },
              );
            },
          ),
          Slider(
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
                debugPrint(sliderValue.toString());
              });
            },
            min: 0,
            max: 50,
            divisions: 10,
            label: sliderValue.toString(),
          )
        ],
      ),
    );
  }
}
