import 'package:flutter/material.dart';

void main() {
  runApp(const WorldClock());
}

class WorldClock extends StatelessWidget {
  const WorldClock({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apple Clone Alarm Project',
      home: WorldClockState(),
    );
  }
}

class WorldClockState extends StatelessWidget {
  const WorldClockState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Color.fromARGB(255, 226, 168, 31),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '+',
                  style: TextStyle(
                    color: Color.fromARGB(255, 226, 168, 31),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(170, 158, 158, 158)))),
            child: const Text(
              'World Clock',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(170, 158, 158, 158)))),
            child: const Text(
              'Cupertino',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(170, 158, 158, 158)))),
            child: const Text(
              'New York',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
