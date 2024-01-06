import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: KeyboardInputPage(),
    );
  }
}

class KeyboardInputPage extends StatefulWidget {
  const KeyboardInputPage({super.key});
  @override
  KeyboardInputPageState createState() => KeyboardInputPageState();
}

class KeyboardInputPageState extends State<KeyboardInputPage> {
  String targetString = WordPair.random().asString;
  //String targetString = "flutter";
  String userInput = "";
  List<Color> feedbackColors = [];

  @override
  void initState() {
    super.initState();
    feedbackColors = List<Color>.filled(targetString.length, Colors.transparent);
  }

  void checkInput() {
    for (int i = 0; i < targetString.length && i < userInput.length; i++) {
      if (targetString[i] == userInput[i]) {
        feedbackColors[i] = Colors.green;
      } else {
        feedbackColors[i] = Colors.red;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keyboard Input App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Target String: $targetString',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < targetString.length; i++)
                Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: feedbackColors[i],
                  ),
                  child: Center(
                    child: Text(
                      i < userInput.length ? userInput[i] : '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (value) {
              userInput = value;
              checkInput();
            },
            decoration: const InputDecoration(
              hintText: 'Type here...',
              hintStyle: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}