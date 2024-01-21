import 'package:bloctut/counter_screen.dart';
import 'package:bloctut/option.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math show Random;

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Myapp());
}

List<String> names = ['manoj', 'monika', 'roshani', 'manish', 'deepak'];

extension Randomelement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Option(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NameCubit extends Cubit<String?> {
  NameCubit() : super(null);

  void getrandomelement() => emit(names.getRandomElement());
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final NameCubit cubit;

  @override
  void initState() {
    cubit = NameCubit();
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app bar'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: cubit.stream,
          builder: (context, snapshot) {
            final button = TextButton(
                onPressed: () => cubit.getrandomelement(),
                child: const Text('get random image '));

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return button;

              case ConnectionState.waiting:
                return button;

              case ConnectionState.active:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(snapshot.data ?? ''), button],
                );

              case ConnectionState.done:
                return SizedBox();
            }
          }),
    );
  }
}
