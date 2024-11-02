import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apple Clone Alarm Project',
      home: TimersPage(),
    );
  }
}

class TimersPage extends StatelessWidget {
  const TimersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TimersPageState();
  }
}

class TimersPageState extends StatefulWidget {
  const TimersPageState({super.key});

  @override
  State<TimersPageState> createState() => _TimersPageState();
}

class _TimersPageState extends State<TimersPageState> {
  // Initialize a list to hold the state of each switch in the list
  List<bool> alarmSwitchStates = List.generate(2, (_) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildAlarmInfo(),
          // Expanded(
          //   child: _buildTimerList(),
          // ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Edit',
              style: TextStyle(color: Colors.orange[300], fontSize: 16),
            ),
            // const Spacer(),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text('Timers',
                      style: TextStyle(color: Colors.white, fontSize: 16))),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAlarmInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(child: Container(child: Row())),
    );
  }

  // Widget _buildTimerList() {}
}
