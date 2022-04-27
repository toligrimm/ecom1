import 'package:ecom/pages/homepage.dart';
import 'package:flutter/material.dart';

class LoginSuccess extends StatefulWidget {
  static String routeName = "/login_success";

  const LoginSuccess({Key? key}) : super(key: key);

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/success.jpg'),
          const Text('Успешно!', style: TextStyle(color: Colors.orange, fontSize: 36, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          SizedBox(
            width: 340,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                child: const Text('Вернуться на главную'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 18)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )))),
          ),
        ],
      ),

    );
  }
}
