import 'package:ecom/helpers/form_error.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helpers/constants.dart';
import 'body.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({Key? key}) : super(key: key);

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  String? email;
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
                  errors.add(kInvalidEmailError);
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
          const SizedBox(height: 20,),
          FormError(errors: errors),

          SizedBox(
            width: 340,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // KeyboardUtil.hideKeyboard(context);
                    // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  }
                },
                child: const Text('Отправить'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 18)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )))),
          ),
          const SizedBox(height: 20,),
          const NoAccountText(),
        ],
      ),
    );
  }
}
