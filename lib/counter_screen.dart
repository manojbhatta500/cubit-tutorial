import 'package:bloctut/counter_cubit.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late final countercubit;
  @override
  void initState() {
    super.initState();

    countercubit = CounterCubit();
  }

  @override
  void dispose() {
    countercubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
          stream: countercubit.stream,
          builder: (context, snapshot) {
            final incrementbutton = ElevatedButton(
              onPressed: () =>
                  countercubit.increment(), // Add function to increase value
              child: Text('Increase'),
            );

            final decrementbutton = ElevatedButton(
              onPressed: () =>
                  countercubit.decrement(), // Add function to increase value
              child: Text('decrease'),
            );

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [incrementbutton, decrementbutton],
                    )
                  ],
                );

              case ConnectionState.waiting:
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [incrementbutton, decrementbutton],
                    )
                  ],
                );
              case ConnectionState.active:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // Replace this with the actual number value
                        snapshot.data.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          incrementbutton,
                          SizedBox(width: 10),
                          decrementbutton
                        ],
                      ),
                    ],
                  ),
                );
              case ConnectionState.done:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          incrementbutton,
                          SizedBox(width: 10),
                          decrementbutton
                        ],
                      ),
                    ],
                  ),
                );
            }
          }),
    );
  }
}
