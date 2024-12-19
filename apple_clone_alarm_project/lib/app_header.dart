import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Edit',
            style: TextStyle(color: Colors.orange[300], fontSize: 16),
          ),
          Icon(Icons.add, color: Colors.orange[300]),
        ],
      ),
    );
  }
}








class TimerHeader extends StatefulWidget {
  const TimerHeader({super.key});

  @override
  State<TimerHeader> createState() => _TimerHeaderState();
}

class _TimerHeaderState extends State<TimerHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Edit',
            style: TextStyle(color: Colors.orange[300], fontSize: 16),
          ),
          // Icon(Icons.add, color: Colors.orange[300]),
          SizedBox(width: 185,),
          Text(
            'Timers',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}