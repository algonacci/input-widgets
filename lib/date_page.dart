import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DatePage extends StatelessWidget {
  const DatePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    TimeOfDay currentHour = TimeOfDay.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Date and Time Picker',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2023, 12, 31),
                ).then((selectedDate) {
                  var newDate = selectedDate;
                  debugPrint(selectedDate!.toString());
                  debugPrint(selectedDate.toUtc().toString());
                  debugPrint(selectedDate.toIso8601String().toString());
                  debugPrint(newDate!.year.toString());
                  debugPrint(newDate.month.toString());
                  var formattedDate =
                      DateTime.parse(selectedDate.toLocal().toString());
                  debugPrint(formattedDate.toString());
                  debugPrint(formattedDate.toIso8601String());
                  debugPrint(
                      formatDate(selectedDate, [yyyy, '-', mm, '-', dd]));
                });
              },
              child: const Text(
                'Date Selection',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: currentHour,
                ).then((selectedTime) {
                  debugPrint(selectedTime.toString());
                  debugPrint(selectedTime!.hour.toString());
                });
              },
              child: const Text(
                'Time Selection',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Test',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
