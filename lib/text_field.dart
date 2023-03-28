import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using TextField"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: 3,
              maxLength: 15,
              onChanged: (String value) {
                debugPrint(value);
              },
              onSubmitted: (String value) {
                debugPrint('submit $value');
              },
              decoration: const InputDecoration(
                labelText: "Label Text",
                hintText: "Username",
                // icon: Icon(Icons.add),
                prefixIcon: Icon(Icons.grade),
                suffixIcon: Icon(Icons.ac_unit),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
