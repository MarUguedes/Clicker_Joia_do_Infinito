import 'package:flutter/material.dart';

void main() {
  runApp(const Stone());
}

int fragments = 0;
int pieces = 0;
int stone = 0;

class Stone extends StatefulWidget {
  const Stone({Key? key}) : super(key: key);

  @override
  _StoneState createState() => _StoneState();
}

class _StoneState extends State<Stone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'JÓIA DO INFINITO',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 8,
                      color: Color.fromARGB(232, 98, 34, 182),
                    )
                  ]),
            ),
            Container(
              height: 50,
            ),
            joia(),
            Container(
              height: 30,
            ),
            Text(
              'Stones: $stone\nPieces: $pieces\nFragments: $fragments',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.star_rate,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              joia();
              fragments++;
              if (fragments == 10) {
                pieces++;
                fragments = 0;
              }
              if (pieces == 10) {
                stone++;
                pieces = 0;
              }
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50,
            color: Colors.grey[900],
          ),
        ),
      ),
    );
  }
}

Image joia() {
  if (stone != 0) {
    return Image.network(
        'https://camo.githubusercontent.com/afc2d6fab0b5262d761f4f7ea53440db2d4363ff86d955e03837d0325963ecc8/68747470733a2f2f692e696d6775722e636f6d2f4a4165475262312e706e67');
  } else if (pieces != 0) {
    return Image.network(
        'https://camo.githubusercontent.com/394b5b22aaad6b38d4d0ba61dd39c660d7f6f177cec3d435875f7deaa65b43e9/68747470733a2f2f692e696d6775722e636f6d2f495235536e36582e706e67');
  } else {
    return Image.network(
        'https://camo.githubusercontent.com/0abe58ebc2fe9cc1089ab3915e6156b2c30622b405529dc42965d603f468abf4/68747470733a2f2f692e696d6775722e636f6d2f6a54714e6137442e706e67');
  }
}
