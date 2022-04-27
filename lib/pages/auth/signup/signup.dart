import 'package:ecom/save_data/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helpers/constants.dart';
import '../../../helpers/form_error.dart';
import '../complete_page/complete_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late List<Account> accounts;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text(
              'Регистрация учетки',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Давай регистрируйся и покупай вещи, слышь?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CupertinoColors.secondaryLabel,
                fontSize: 18,
              ),
            ),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isShown = true;
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) => email = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kEmailNullError);
                  } else if (emailValidatorRegExp.hasMatch(value)) {
                    removeError(error: kInvalidEmailError);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                    setState(() {
                      errors.add(kEmailNullError);
                    });
                    if (!emailValidatorRegExp.hasMatch(value) &&
                        !errors.contains(kInvalidEmailError)) {
                      setState(() {
                        errors.add(kInvalidEmailError);
                      });
                    }
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Почта',
                    hintText: 'Введи почту',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: CupertinoColors.systemOrange,
                      ),
                      gapPadding: 10,
                    ),
                    suffixIcon: const Icon(CupertinoIcons.mail),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: CupertinoColors.systemOrange,
                      ),
                      gapPadding: 10,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: _isShown,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kPassNullError);
                  } else if (value.length >= 8) {
                    removeError(error: kShortPassError);
                  }
                  password = value;

                },
                decoration: InputDecoration(
                    hintText: 'Введи пароль',
                    labelText: 'Пароль',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: CupertinoColors.systemOrange,
                      ),
                      gapPadding: 10,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isShown ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isShown = !_isShown;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: CupertinoColors.systemOrange,
                      ),
                      gapPadding: 10,
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kPassNullError);
                    return "";
                  } else if (value.length < 8) {
                    addError(error: kShortPassError);
                    return "";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: _isShown,
                onSaved: (newValue) => confirmPassword = newValue,
                onChanged: (value) {
                  if (password == confirmPassword) {
                    removeError(error: kMatchPassError);
                  }
                  // return null;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "";
                  } else if (password != value) {
                    addError(error: kMatchPassError);
                    return "";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Подтверди пароль',
                    labelText: 'Пароль',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: CupertinoColors.systemOrange,
                      ),
                      gapPadding: 10,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isShown ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isShown = !_isShown;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: CupertinoColors.systemOrange,
                      ),
                      gapPadding: 10,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              FormError(errors: errors),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 340,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CompletePage()),
                        );
                      }
                    },
                    child: const Text('Подтвердить'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 18)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
