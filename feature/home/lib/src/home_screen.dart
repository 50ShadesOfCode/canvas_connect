import 'package:flutter/material.dart';

import 'painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final PainterController _controller = PainterController()
    ..thickness = 5.0
    ..backgroundColor = Colors.black
    ..drawColor = Colors.white;
  final PainterController _controller1 = PainterController()
    ..pathHistory = _controller.pathHistory
    ..thickness = 5.0
    ..backgroundColor = Colors.black
    ..drawColor = Colors.white;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Clear',
            onPressed: _controller.clear,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Painter(_controller),
          ),
          Expanded(
            child: Painter(_controller1),
          ),
        ],
      ),
    );
  }
}
