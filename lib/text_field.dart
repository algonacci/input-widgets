import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  late TextEditingController nameController;
  FocusNode? _focusNode;
  int maxLineCount = 1;

  @override
  void initState() {
    nameController = TextEditingController(text: "TEST");
    _focusNode = FocusNode();
    _focusNode!.addListener(() {
      setState(() {
        if (_focusNode!.hasFocus) {
          maxLineCount = 5;
        } else {
          maxLineCount = 1;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    _focusNode!.dispose();
    super.dispose();
  }

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
              focusNode: _focusNode,
              controller: nameController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: maxLineCount,
              maxLength: 15,
              onChanged: (String value) {
                nameController.value = TextEditingValue(
                  text: value,
                  selection: TextSelection.collapsed(
                    offset: value.length,
                  ),
                );
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
          Text(nameController.text),
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
        onPressed: () {
          setState(() {
            nameController.text = "Flutter";
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
