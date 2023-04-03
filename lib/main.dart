import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int>{
  Counter(int num) : super(num);

  void increment() {
    state++;
  }
}

final countProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter(0);
});


void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(countProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text("$value"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            ref.read(countProvider.notifier).increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}