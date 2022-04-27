import 'package:ecom/helpers/form_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helpers/constants.dart';
import '../login_success/login_success.dart';

class CompletePage extends StatefulWidget {
  static String routeName = "/complete_page";
  const CompletePage({Key? key}) : super(key: key);

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text('Регистрация учетки',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 28,
                    )),
                const Text('Заполни форму', textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CupertinoColors.secondaryLabel,
                    fontSize: 18,
                  ),),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  onSaved: (newValue) => firstName = newValue,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kNamelNullError);
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                        addError(error: kNamelNullError);
                        return "";
                      }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Имя',
                      hintText: 'Мал',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CupertinoColors.systemOrange,
                        ),
                        gapPadding: 10,
                      ),
                      suffixIcon: const Icon(CupertinoIcons.person),
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
                  onSaved: (newValue) => lastName = newValue,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kNamelNullError);
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kNamelNullError);
                      return "";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Фамилия',
                      hintText: 'Малов',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CupertinoColors.systemOrange,
                        ),
                        gapPadding: 10,
                      ),
                      suffixIcon: const Icon(CupertinoIcons.person),
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
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) => phoneNumber = newValue,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kPhoneNumberNullError);
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kPhoneNumberNullError);
                      return "";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Мобильный телефон',
                      hintText: '+7 777 123 45 67',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CupertinoColors.systemOrange,
                        ),
                        gapPadding: 10,
                      ),
                      suffixIcon: const Icon(CupertinoIcons.device_phone_portrait),
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
                SizedBox(
                  width: 340,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginSuccess()),
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
      ),
    );
  }
}
