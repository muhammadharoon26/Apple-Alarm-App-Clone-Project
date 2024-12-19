// import 'dart:async';

// class StopwatchLogic {
//   final Stopwatch _stopwatch = Stopwatch();
//   Duration _elapsedTime = Duration.zero;
//   String _elapsedTimeString = '00:00.0';
//   Timer? _timer;
//   final List<Duration> lapList = [];

//   StopwatchLogic() {
//     _startTimer();
//   }

//   // Getter for elapsed time string
//   String get elapsedTimeString => _elapsedTimeString;

//   // Getter for lap list
//   List<Duration> get laps => lapList;

//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
//       if (_stopwatch.isRunning) {
//         _updateElapsedTime();
//       }
//     });
//   }

//   void startStopwatch() {
//     if (!_stopwatch.isRunning) {
//       _stopwatch.start();
//       _updateElapsedTime();
//     } else {
//       _stopwatch.stop();
//     }
//   }

//   void resetStopwatch() {
//     _stopwatch.reset();
//     _updateElapsedTime();
//     lapList.clear();
//   }

//   void lap() {
//     lapList.add(_stopwatch.elapsed);
//   }

//   void _updateElapsedTime() {
//     _elapsedTime = _stopwatch.elapsed;
//     _elapsedTimeString = _formatElapsedTime(_elapsedTime);
//   }

//   String _formatElapsedTime(Duration time) {
//     return '${time.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(time.inSeconds.remainder(60)).toString().padLeft(2, '0')}.${(time.inMilliseconds % 1000 ~/ 100).toString()}';
//   }

//   void dispose() {
//     _timer?.cancel();
//   }
// }











import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchLogic extends ChangeNotifier {
  Stopwatch get stopwatch => _stopwatch;
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;
  List<Duration> lapList = [];

  String get elapsedTimeString => formatElapsedTime(_elapsedTime);

  StopwatchLogic() {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (_stopwatch.isRunning) {
        _updateElapsedTime();
      }
    });
  }

  void startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _updateElapsedTime();
    } else {
      _stopwatch.stop();
    }
    notifyListeners();
  }

  void resetStopwatch() {
    _stopwatch.reset();
    _updateElapsedTime();
    lapList.clear();
    notifyListeners();
  }

  void recordLap() {
    lapList.add(_stopwatch.elapsed);
    notifyListeners();
  }

  List<Duration> get laps => lapList;

  void _updateElapsedTime() {
    _elapsedTime = _stopwatch.elapsed;
    notifyListeners();
  }

  String formatElapsedTime(Duration time) {
    return '${time.inMinutes.remainder(60).toString().padLeft(2, '0')}:${time.inSeconds.remainder(60).toString().padLeft(2, '0')}.${(time.inMilliseconds % 1000 ~/ 100).toString()}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
