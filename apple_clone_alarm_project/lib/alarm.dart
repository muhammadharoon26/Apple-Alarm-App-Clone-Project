import 'package:flutter/material.dart';

void main() {
  runApp(const AlarmPage());
}

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apple Clone Alarm Project',
      home: AlarmPageState(),
    );
  }
}

class AlarmPageState extends StatefulWidget {
  const AlarmPageState({super.key});

  @override
  State<AlarmPageState> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
          ),
          Padding(
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
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.king_bed,
                      color: Colors.white,
                    ),
                    Text(
                      ' Sleep | Wake Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    )
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
                            // fontWeight: FontWeight.w300,
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
                        backgroundColor:
                            const Color.fromARGB(60, 245, 245, 245),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        minimumSize:
                            Size.zero, // Remove minimum button size constraint
                        tapTargetSize: MaterialTapTargetSize
                            .shrinkWrap, // Shrinks the tap target
                      ),
                      child: Text(
                        'CHANGE',
                        style: TextStyle(color: Colors.orange[300]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
