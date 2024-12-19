import 'package:flutter/material.dart';
import 'package:apple_clone_alarm_project/views/widgets/app_header.dart';

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
      home: AlarmPage(),
    );
  }
}

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlarmPageState();
  }
}

class AlarmPageState extends StatefulWidget {
  const AlarmPageState({super.key});

  @override
  State<AlarmPageState> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPageState> {
  // Initialize a list to hold the state of each switch in the list
  List<bool> alarmSwitchStates = List.generate(2, (_) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          _buildAlarmInfo(),
          Expanded(
            child: _buildAlarmList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAlarmInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alarm',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.king_bed, color: Colors.white),
              Text(
                ' Sleep | Wake Up',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(105, 245, 245, 245),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Alarm',
                    style: TextStyle(
                      color: Color.fromARGB(105, 245, 245, 245),
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    ' Tomorrow Morning',
                    style: TextStyle(
                        color: Color.fromARGB(105, 245, 245, 245),
                        fontSize: 14),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(60, 245, 245, 245),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'CHANGE',
                  style: TextStyle(color: Colors.orange[300]),
                ),
              )
            ],
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(105, 245, 245, 245),
          ),
          const SizedBox(height: 40),
          const Text('Other',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          const Divider(
            height: 1,
            color: Color.fromARGB(105, 245, 245, 245),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildAlarmList() {
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
                  Switch(
                    value: alarmSwitchStates[index],
                    trackOutlineColor: WidgetStateProperty.all(Colors.black54),
                    activeTrackColor: const Color.fromARGB(255, 62, 236, 77),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.black54,
                    onChanged: (bool value) {
                      setState(() {
                        alarmSwitchStates[index] = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: alarmSwitchStates.length,
    );
  }
}
