import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorldClock extends StatefulWidget {
  const WorldClock({super.key});

  @override
  State<WorldClock> createState() => _WorldClockState();
}

class _WorldClockState extends State<WorldClock> {
  Timer? _timer;
  final _timeFormat = DateFormat('h:mm');
  final _amPmFormat = DateFormat('a');

  final _cities = const [
    {
      'name': 'Cupertino',
      'timezone': 'America/Los_Angeles',
      'offset': Duration(hours: -3), // Adjust based on timezone
    },
    {
      'name': 'New York',
      'timezone': 'America/New_York',
      'offset': Duration(hours: -3), // Adjust based on timezone
    },
    {
      'name': 'Cupertino',
      'timezone': 'America/Los_Angeles',
      'offset': Duration(hours: -3), // Adjust based on timezone
    },
    {
      'name': 'New York',
      'timezone': 'America/New_York',
      'offset': Duration(hours: -3), // Adjust based on timezone
    },
    {
      'name': 'Cupertino',
      'timezone': 'America/Los_Angeles',
      'offset': Duration(hours: -3), // Adjust based on timezone
    },
    {
      'name': 'New York',
      'timezone': 'America/New_York',
      'offset': Duration(hours: -3), // Adjust based on timezone
    },
    {
      'name': 'Cupertino',
      'timezone': 'America/Los_Angeles',
      'offset': Duration(hours: -3), // Adjust based on timezone
    },
    {
      'name': 'New York',
      'timezone': 'America/New_York',
      'offset': Duration(hours: -3), // Adjust based on timezone
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => mounted ? setState(() {}) : null,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _getOffsetString(Duration offset) {
    final hours = offset.inHours.abs();
    return '${offset.isNegative ? "-" : "+"}' '$hours' 'HRS';
  }

  DateTime _getCityTime(Duration offset) {
    final now = DateTime.now().toUtc();
    return now.add(offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit',
                        style:
                            TextStyle(color: Colors.orange[300], fontSize: 16),
                      ),
                      Icon(Icons.add, color: Colors.orange[300]),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 20),
                  child: Text(
                    'World Clock',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              indent: 15,
              height: 1,
              color: Color.fromARGB(105, 245, 245, 245),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _cities.length,
                separatorBuilder: (_, __) => const Divider(
                  indent: 15,
                  height: 1,
                  color: Color.fromARGB(105, 245, 245, 245),
                ),
                itemBuilder: (_, index) {
                  final city = _cities[index];
                  final cityTime = _getCityTime(city['offset'] as Duration);

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today, ${_getOffsetString(city['offset'] as Duration)}',
                              style: const TextStyle(
                                  color:
                                      Color.fromARGB(105, 245, 245, 245),
                                  fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              city['name']! as String,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              _timeFormat.format(cityTime),
                              style: const TextStyle(
                                color: Color.fromARGB(105, 245, 245, 245),
                                fontSize: 60,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _amPmFormat.format(cityTime),
                              style: const TextStyle(
                                color: Color.fromARGB(105, 245, 245, 245),
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
