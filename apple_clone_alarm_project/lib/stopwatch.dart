import 'package:flutter/material.dart';

void main() {
  runApp(StopWatchPage());
}

class StopWatchPage extends StatelessWidget {
  const StopWatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apple Clone Alarm Project',
      home: StopWatchPageState(),
    );
  }
}

class StopWatchPageState extends StatelessWidget {
  const StopWatchPageState({super.key});

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
              'Stop Watch',
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