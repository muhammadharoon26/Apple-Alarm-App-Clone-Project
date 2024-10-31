import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorldClock extends StatefulWidget {
  const WorldClock({Key? key}) : super(key: key);

  @override
  _WorldClockState createState() => _WorldClockState();
}

class _WorldClockState extends State<WorldClock> {
  Timer? _timer;
  final List<CityTime> _cities = [
    CityTime(
      cityName: "Cupertino",
      timeZone: "America/Los_Angeles",
      offset: "-3HRS",
    ),
    CityTime(
      cityName: "New York",
      timeZone: "America/New_York",
      offset: "-3HRS",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(),
            _buildTitle(),
            Expanded(child: _buildCityList()),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Edit',
            style: TextStyle(
              color: Colors.orange[300],
              fontSize: 16,
            ),
          ),
          Icon(
            Icons.add,
            color: Colors.orange[300],
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 20),
      child: Text(
        'World Clock',
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCityList() {
    return ListView.builder(
      itemCount: _cities.length,
      itemBuilder: (context, index) {
        return _buildCityItem(_cities[index]);
      },
    );
  }

  Widget _buildCityItem(CityTime city) {
    final now = DateTime.now();
    final timeFormat = DateFormat('h:mm');
    final amPmFormat = DateFormat('a');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[900]!,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today, ${city.offset}',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                city.cityName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                timeFormat.format(now),
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                amPmFormat.format(now),
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CityTime {
  final String cityName;
  final String timeZone;
  final String offset;

  CityTime({
    required this.cityName,
    required this.timeZone,
    required this.offset,
  });
}