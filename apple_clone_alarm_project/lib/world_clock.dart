import 'package:flutter/material.dart';

void main() {
  runApp(const WorldClock());
}

class WorldClock extends StatefulWidget {
  const WorldClock({super.key});

  @override
  State<WorldClock> createState() => WorldClockState();
}

class WorldClockState extends State<WorldClock> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text('Edit',
                    style: TextStyle(
                      color: Color.fromARGB(255, 226, 168, 31),
                    ))),
            Align(
                alignment: Alignment.topRight,
                child: Text('+',
                    style: TextStyle(
                      color: Color.fromARGB(255, 226, 168, 31),
                    ))),
          ]),
          backgroundColor: Colors.black,
        ));
  }
}
