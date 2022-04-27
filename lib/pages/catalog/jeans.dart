import 'package:flutter/material.dart';

class Jeans extends StatefulWidget {
  const Jeans({Key? key}) : super(key: key);

  @override
  State<Jeans> createState() => _JeansState();
}

class _JeansState extends State<Jeans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeans'),
      ),
    );
  }
}
