import 'dart:async';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyStopwatch());
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
          const Align(
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
  late Timer? _timer;

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
  }

  void _updateElapsedTime() {
    setState(() {
      _elapsedTime = _stopwatch.elapsed;
      _elapsedTimeString = _formatElapsedTime(_elapsedTime);
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
                  width: 84,
                  height: 84,
                child:ElevatedButton(
                  onPressed: _resetStopwatch,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(105, 245, 245, 245),
                    ),
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.white,fontSize: 14),
                  ),
                ),),
                SizedBox(
                  width: 84,
                  height: 84,
                  child: ElevatedButton(
                    onPressed: _startStopwatch,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.green.shade900,
                      )
                    ),
                    child: Text(
                      _stopwatch.isRunning ? 'Stop' : 'Start',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 59, 173, 65),
                        fontSize: 14
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}