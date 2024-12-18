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
  // Dummy data for hours, minutes, and seconds
  final List<String> hours = List.generate(13, (index) => '$index hours');
  final List<String> minutes = List.generate(60, (index) => '$index min');
  final List<String> seconds = List.generate(60, (index) => '$index sec');
  List<bool> timerSwitchStates = List.generate(2, (_) => true);

  void _startTimer() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Timers'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Single gray background behind magnified items
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.9, // Adjust width as needed
              height: 100, // Adjust height to match magnified area
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.9, // Adjust width as needed
                height: 200, // Adjust height as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // alignment: Alignment.center,
                  children: [
                    _buildTimeWheel(hours),
                    _buildTimeWheel(minutes),
                    _buildTimeWheel(seconds),
                    // SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width *
                0.9, // Adjust width as needed
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
                      // _stopwatch.isRunning ? 'Stop' : 'Start',
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
                ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width *
                0.9, // Adjust width as needed
            height: 100,
            child: Column(
              children: [
                // "Label" Section
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
                Divider(color: Colors.grey, height: 0), // Thin divider

                // "When Timer Ends" Section
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
                        Icon(Icons.chevron_right, color: Colors.grey), // Arrow
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text('Recents',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          const Divider(
            height: 1,
            color: Color.fromARGB(105, 245, 245, 245),
          ),
          Expanded(
            child: _buildTimerList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeWheel(List<String> items) {
    return SizedBox(
      width: 90, // Adjust width to match the wheel's width
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
        indent: 15,
        height: 1,
        color: Color.fromARGB(105, 245, 245, 245),
      ),
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
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
                          fontSize: 60,
                        ),
                      ),
                      Text(
                        'AM',
                        style: TextStyle(
                          color: Color.fromARGB(105, 245, 245, 245),
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Alarm',
                    style: TextStyle(
                        color: Color.fromARGB(105, 245, 245, 245),
                        fontSize: 14),
                  ),
                  SizedBox(height: 4)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  // Switch(
                  //   value: timerSwitchStates[index],
                  //   trackOutlineColor: WidgetStateProperty.all(Colors.black54),
                  //   activeTrackColor: const Color.fromARGB(255, 62, 236, 77),
                  //   inactiveThumbColor: Colors.white,
                  //   inactiveTrackColor: Colors.black54,
                  //   onChanged: (bool value) {
                  //     setState(() {
                  //       timerSwitchStates[index] = value;
                  //     });
                  //   },
                  // ),
                  IconButton(
                    onPressed: _startTimer,
                    icon: const Icon(
                      Icons.play_arrow, // Play button icon
                      size: 40, // Adjust the icon size as needed
                      color: Color.fromARGB(
                          255, 59, 173, 65), // Same as the text color
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          170, 21, 81, 25), // Same background
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
