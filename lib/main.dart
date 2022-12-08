import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DrawingApp(),
    );
  }
}

class DrawingApp extends StatefulWidget {
  const DrawingApp({super.key});

  @override
  State<DrawingApp> createState() => _DrawingAppState();
}

class _DrawingAppState extends State<DrawingApp> {
  late ScribbleNotifier notifier;

  @override
  void initState() {
    notifier = ScribbleNotifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => notifier.clear(),
        child: const Icon(Icons.clear),
      ),
      appBar: AppBar(
        title: const Text('Drawing App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Scribble(notifier: notifier)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => notifier.setEraser(),
                  child: const Text('Erase')),
              ElevatedButton(
                  onPressed: () => notifier.setColor(Colors.blue),
                  child: const Text('COlor blue')),
              ElevatedButton(
                  onPressed: () => notifier.setColor(Colors.green),
                  child: const Text('COlor green')),
              ElevatedButton(
                  onPressed: () => notifier.setColor(Colors.red),
                  child: const Text('COlor red')),
              ElevatedButton(
                  onPressed: () => notifier.setColor(Colors.black),
                  child: const Text('COlor black')),
            ],
          )
        ],
      ),
    );
  }
}
