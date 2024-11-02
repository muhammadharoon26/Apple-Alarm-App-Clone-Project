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
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height:100),
          _buildTimersInfo(),
          // Expanded(
          //   child: _buildTimersList(),
          // ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Edit',
            style: TextStyle(color: Colors.orange[300], fontSize: 16),
          ),
          Text('Timers',
              style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(height:10,width:50)
        ],
      ),
    );
  }

  Widget _buildTimersInfo() {
    return Container(
      width:350,
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(5),
        color: Colors.grey[800],
      ),
      child: Center(child: Container(child: Row())),
    );
  }

  // Widget _buildTimersList() {}
}
