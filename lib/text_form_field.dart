import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldPage extends StatelessWidget {
  const TextFormFieldPage({super.key});

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
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: 'Algonacci',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Username',
                  ),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: 'Algonacci@gmail.com',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Email',
                  ),
                  validator: (email) {
                    if (!EmailValidator.validate(email!)) {
                      return 'Email is not valid!';
                    }
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
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Password must be at least 8 characters!';
                    }
                  },
                ),
                const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
