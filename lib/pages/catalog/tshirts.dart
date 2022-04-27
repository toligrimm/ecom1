import 'package:flutter/material.dart';



class TShirts extends StatefulWidget {
  const TShirts({Key? key}) : super(key: key);

  @override
  State<TShirts> createState() => _TShirtsState();
}

class _TShirtsState extends State<TShirts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T-Shirts'),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(30),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/rbt1.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('Red Bull Racing F1', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/rbt2.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('Red Bull Racing F1 polo', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/merc.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('Mercedes AMG F1 white', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/merct1.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('Mercedes AMG F1 black', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/merct3.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('Mercedes AMG F1 white longsleeve', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/mct2.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('McLaren F1', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/mct1.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('McLaren F1 plain', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/frt1.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('Scuderia Ferrari F1', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/amt1.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('Aston Martin F1', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/amt2.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('Aston Martin F1 longsleeve', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/art1.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('Alfa Romeo F1', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TShirts()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/att1.jpg',
                    width: 120,
                    height: 120,
                  ),
                  const Text('Alpha Tauri F1', style: TextStyle(color: Colors.black87),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
