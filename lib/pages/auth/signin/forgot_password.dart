import 'package:flutter/material.dart';

import 'forgotform.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Восстановить пароль'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              Text(
                'Забыл пароль?',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Text('и нафига забывать пароль? давай вводи почту',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black54)),
              SizedBox(
                height: 20,
              ),
              ForgotForm(),

            ],
          ),
        ),
      ),
    );
  }
}
