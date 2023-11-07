import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a Provider for the counter
final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Riverpod Example'),
        ),
        body: Center(
          child: Consumer(
            builder: (context, watch, child) {
              final counter = watch(counterProvider).state;
              return Text(
                'Counter Value: $counter',
                style: TextStyle(fontSize: 24),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Modify the counter value
            context.read(counterProvider).state++;
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}