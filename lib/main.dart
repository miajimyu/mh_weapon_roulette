import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

const List<String> weapons = [
  '大剣',
  '片手剣',
  '双剣',
  '太刀',
  'ハンマー',
  '狩猟笛',
  'ランス',
  'ガンランス',
  'スラッシュアックス',
  'チャージアックス',
  '操虫棍',
  '弓',
  'ライトボウガン',
  'ヘビィボウガン'
];

void main() async {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    // Window Option
    const _size = Size(380, 410);
    WindowOptions windowOptions = const WindowOptions(
      size: _size,
      // minimumSize: _size,
      // maximumSize: _size,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      alwaysOnTop: true,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setAlignment(Alignment.bottomRight);
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String title = 'MH Weapon Roulette';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String label1 = '武器';
  String label2 = '武器';
  String label3 = '武器';
  String label4 = '武器';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyItem(label: label1),
          MyItem(label: label2),
          MyItem(label: label3),
          MyItem(label: label4),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            label1 = weapons[Random().nextInt(weapons.length)];
            label2 = weapons[Random().nextInt(weapons.length)];
            label3 = weapons[Random().nextInt(weapons.length)];
            label4 = weapons[Random().nextInt(weapons.length)];
          });
        },
        tooltip: 'Roll',
        child: const Icon(Icons.casino),
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  final String label;

  const MyItem({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 10 / 2,
      child: Card(
        shadowColor: Colors.blue,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 32, fontFamily: 'Kosugi'),
          ),
        ),
      ),
    );
  }
}
