import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldPage extends StatefulWidget {
  const TextFormFieldPage({super.key});

  @override
  State<TextFormFieldPage> createState() => _TextFormFieldPageState();
}

class _TextFormFieldPageState extends State<TextFormFieldPage> {
  String? _username;
  String? _email;
  String? _password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Operations',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  // initialValue: 'Algonacci',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Username',
                  ),
                  onSaved: (value) {
                    _username = value!;
                  },
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Username must be at least 6 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  // initialValue: 'Algonacci@gmail.com',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Email',
                  ),
                  onSaved: (value) {
                    _email = value!;
                  },
                  validator: (email) {
                    if (!EmailValidator.validate(email!)) {
                      return 'Email is not valid!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Password',
                  ),
                  onSaved: (value) {
                    _password = value!;
                  },
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Password must be at least 8 characters!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) {
                      _formKey.currentState!.save();
                    }
                    String result =
                        'username:$_username\nemail:$_email\npassword:$_password';
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          result,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Submit',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
