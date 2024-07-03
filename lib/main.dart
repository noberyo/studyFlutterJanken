import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  static const String goo = '✊';
  static const String choki = '✌️';
  static const String par = '✋';

  String myHand = goo;
  String computerHand = goo;
  String result = '引き分け';

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if (myHand == goo && computerHand == choki ||
        myHand == choki && computerHand == par ||
        myHand == par && computerHand == goo) {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    generateComputerHand();
    judge();
    setState(() {});
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return goo;
      case 1:
        return choki;
      case 2:
        return par;
      default:
        return goo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STUDY FLUTTER JANKEN"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(
                fontSize: 48,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Text(
              computerHand,
              style: const TextStyle(
                fontSize: 48,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Text(
              myHand,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand(goo);
                  },
                  child: const Text(goo),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand(choki);
                  },
                  child: const Text(choki),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand(par);
                  },
                  child: const Text(par),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
