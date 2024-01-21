import 'package:bloctut/counter_screen.dart';
import 'package:bloctut/main.dart';
import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CounterScreen()));
              },
              child: Text('counter')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
              child: Text('string Example')),
        ],
      ),
    );
  }
}
