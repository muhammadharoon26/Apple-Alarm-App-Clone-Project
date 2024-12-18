import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apple Clone Alarm Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const TimersPage(),
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
  final List<String> hours = List.generate(13, (index) => '$index hours');
  final List<String> minutes = List.generate(60, (index) => '$index min');
  final List<String> seconds = List.generate(60, (index) => '$index sec');
  List<bool> timerSwitchStates = List.generate(3, (_) => true);

  void _startTimer() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Text(
            'Timers',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTimeWheel(hours),
                    _buildTimeWheel(minutes),
                    _buildTimeWheel(seconds),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(170, 21, 81, 25),
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(87, 87),
                    maximumSize: const Size(87, 87),
                    shape: const CircleBorder(),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color.fromARGB(255, 59, 173, 65),
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _startTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(170, 21, 81, 25),
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(87, 87),
                    maximumSize: const Size(87, 87),
                    shape: const CircleBorder(),
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      color: Color.fromARGB(255, 59, 173, 65),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 100,
            child: Column(
              children: [
                Container(
                  color: Colors.grey[900],
                  child: ListTile(
                    title: Text(
                      'Label',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    trailing: Text(
                      'Laundry 🧺🧦',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Divider(color: Colors.grey, height: 0),
                Container(
                  color: Colors.grey[900],
                  child: ListTile(
                    title: Text(
                      'When Timer Ends',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sprinkles',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text('Recents',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          const Divider(height: 1, color: Color.fromARGB(105, 245, 245, 245)),
          Expanded(
            child: _buildTimerList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeWheel(List<String> items) {
    return SizedBox(
      width: 90,
      child: ListWheelScrollView.useDelegate(
        diameterRatio: 2.0,
        itemExtent: 42,
        physics: const FixedExtentScrollPhysics(),
        useMagnifier: true,
        magnification: 1.5,
        childDelegate: ListWheelChildLoopingListDelegate(
          children: items
              .map((item) => Center(
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTimerList() {
    return ListView.separated(
      separatorBuilder: (_, __) => const Divider(
          indent: 15, height: 1, color: Color.fromARGB(105, 245, 245, 245)),
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '7:00',
                        style: TextStyle(
                            color: Color.fromARGB(105, 245, 245, 245),
                            fontSize: 60),
                      ),
                      Text(
                        'AM',
                        style: TextStyle(
                            color: Color.fromARGB(105, 245, 245, 245),
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Text(
                    'Alarm',
                    style: TextStyle(
                        color: Color.fromARGB(105, 245, 245, 245),
                        fontSize: 14),
                  ),
                  SizedBox(height: 4),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  IconButton(
                    onPressed: _startTimer,
                    icon: const Icon(Icons.play_arrow,
                        size: 40, color: Color.fromARGB(255, 59, 173, 65)),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color.fromARGB(170, 21, 81, 25),
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(65, 65),
                      maximumSize: const Size(65, 65),
                      shape: const CircleBorder(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: timerSwitchStates.length,
    );
  }
}
