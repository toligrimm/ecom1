import 'package:ecom/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Ecommerce());


class Ecommerce extends StatelessWidget {
  const Ecommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: const HomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: CupertinoColors.secondarySystemBackground,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.indigo[900]),
          titleTextStyle: TextStyle(color: Colors.indigo[900], fontSize: 20),
          centerTitle: true,
        ),
        scaffoldBackgroundColor: CupertinoColors.secondarySystemBackground,
        ),
      );

  }
}
