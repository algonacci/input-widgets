import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int activeStep = 0;
  String? username, email, password;
  List<Step> steps = [];
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    steps = allSteps();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          onStepContinue: () {
            setState(() {
              // if (activeStep < steps.length - 1) {
              //   activeStep++;
              // }
              continueControl();
            });
          },
          onStepCancel: () {
            setState(() {
              if (activeStep > 0) {
                activeStep--;
              } else {
                activeStep = 0;
              }
            });
          },
          currentStep: activeStep,
          // onStepTapped: (selectedStep) {
          //   setState(() {
          //     activeStep = selectedStep;
          //   });
          // },
          steps: steps,
        ),
      ),
    );
  }

  List<Step> allSteps() {
    List<Step> steps = [
      Step(
        title: const Text('Username'),
        subtitle: const Text('Username Subtitle'),
        state: setSteps(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          validator: (incomingValue) {
            if (incomingValue!.length < 4) {
              return 'Please at least 4 characters';
            }
            return null;
          },
          onSaved: (incomingValue) {
            username = incomingValue;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: ('Username'),
            hintText: ('Username'),
          ),
        ),
      ),
      Step(
        title: const Text('Email'),
        subtitle: const Text('Email Subtitle'),
        state: setSteps(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          validator: (incomingValue) {
            if (!incomingValue!.contains('@')) {
              return 'Please input a valid email';
            }
            return null;
          },
          onSaved: (incomingValue) {
            email = incomingValue;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: ('Email'),
            hintText: ('Email'),
          ),
        ),
      ),
      Step(
        title: const Text('Password'),
        subtitle: const Text('Password Subtitle'),
        state: setSteps(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          validator: (incomingValue) {
            if (incomingValue!.length < 6) {
              return 'Please at least 6 characters';
            }
            return null;
          },
          onSaved: (incomingValue) {
            password = incomingValue;
          },
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: ('Password'),
            hintText: ('Password'),
          ),
        ),
      ),
    ];
    return steps;
  }

  StepState setSteps(int i) {
    if (activeStep == i) {
      if (error) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.indexed;
    }
  }

  void continueControl() {
    switch (activeStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          error = false;
          activeStep++;
        } else {
          error = true;
        }
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          error = false;
          activeStep++;
        } else {
          error = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          error = false;
          activeStep++;
        } else {
          error = true;
        }
        break;
    }
  }
}
