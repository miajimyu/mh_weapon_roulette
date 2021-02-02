import 'dart:math';

import 'package:flutter/material.dart';

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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MH Weapon Roulette',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'MH Weapon Roulette'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
    @required this.label,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 10 / 2,
      child: Card(
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 32, fontFamily: 'Kosugi'),
          ),
        ),
        shadowColor: Colors.blue,
      ),
    );
  }
}
