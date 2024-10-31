import 'package:flutter/material.dart';

void main() {
  runApp(AlarmPage());
}

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apple Clone Alarm Project',
      home: AlarmPageState(),
    );
  }
}

class AlarmPageState extends StatelessWidget {
  const AlarmPageState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(
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
          SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Alarm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}