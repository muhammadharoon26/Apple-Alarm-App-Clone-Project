import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const StopWatchPage());
}

class StopWatchPage extends StatelessWidget {
  const StopWatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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

class MyStopwatch extends StatefulWidget {
  const MyStopwatch({super.key});

  @override
  State<MyStopwatch> createState() => _MyStopwatchState();
}

class _MyStopwatchState extends State<MyStopwatch> {
  final Stopwatch _stopwatch = Stopwatch();
  late Duration _elapsedTime;
  late String _elapsedTimeString;
  Timer? _timer;
  List<Duration> lapList = [];

  @override
  void initState() {
    super.initState();
    _elapsedTime = Duration.zero;
    _elapsedTimeString = _formatElapsedTime(_elapsedTime);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        if (_stopwatch.isRunning) {
          _updateElapsedTime();
        }
      });
    });
  }

  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _updateElapsedTime();
    } else {
      _stopwatch.stop();
    }
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    _updateElapsedTime();
    lapList.clear();
  }

  void _updateElapsedTime() {
    setState(() {
      _elapsedTime = _stopwatch.elapsed;
      _elapsedTimeString = _formatElapsedTime(_elapsedTime);
    });
  }

  void _lap() {
    setState(() {
      lapList.add(_stopwatch.elapsed);
    });
  }

  String _formatElapsedTime(Duration time) {
    return '${time.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(time.inSeconds.remainder(60)).toString().padLeft(2, '0')}.${(time.inMilliseconds % 1000 ~/ 100).toString()}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _elapsedTimeString,
              style: const TextStyle(color: Colors.white, fontSize: 60.0),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: Stack(alignment: Alignment.center, children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color.fromARGB(71, 245, 245, 245),
                              width: 3)),
                    ),
                    ElevatedButton(
                      onPressed: _resetStopwatch,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(71, 245, 245, 245),
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(87, 87),
                        maximumSize: const Size(87, 87),
                        shape: const CircleBorder(),
                      ),
                      child: const Text(
                        'Reset',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  width: 90,
                  height: 90,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outermost outline
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          // borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromARGB(100, 59, 173, 65),
                            width: 3,
                          ),
                        ),
                      ),
                      // Main button with innermost outline
                      ElevatedButton(
                        onPressed: _startStopwatch,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(170, 21, 81, 25),
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(87, 87),
                          maximumSize: const Size(87, 87),
                          shape: const CircleBorder(),
                        ),
                        child: Text(
                          _stopwatch.isRunning ? 'Stop' : 'Start',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 59, 173, 65),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 90,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outermost outline
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          // borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromARGB(100, 59, 173, 65),
                            width: 3,
                          ),
                        ),
                      ),
                      // Main button with innermost outline
                      ElevatedButton(
                        onPressed: _lap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(170, 21, 81, 25),
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(87, 87),
                          maximumSize: const Size(87, 87),
                          shape: const CircleBorder(),
                        ),
                        child: const Text(
                          'Lap',
                          style: TextStyle(
                            color: Color.fromARGB(255, 59, 173, 65),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Divider(
              height: 1,
              color: Color.fromARGB(105, 245, 245, 245),
            ),
            Expanded(
              child: _buildLapList(),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildLapList() {
    return ListView.builder(
      itemCount: lapList.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lap ${index + 1}',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              _formatElapsedTime(lapList[index]),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        );
      },
    );
  }
}
