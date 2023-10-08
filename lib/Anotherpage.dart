import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoiceScreen extends StatefulWidget {
  @override
  _VoiceScreenState createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    initTts();
  }

  Future<void> initTts() async {
    await flutterTts.setLanguage('en-US');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text-to-Speech Example'),
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Expand images to full width
        children: [
          GestureDetector(
            onTap: () {
              speakText('Hello, this is the first image.');
            },
            child: Image.asset(
              'lib/assest/bird.jpg', // Replace with the path to your image
              width: 200.0,
              height: 200.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              speakText('Hello, this is flower.');
            },
            child: Image.asset(
              'lib/assest/flo.jpg', // Replace with the path to your image
              width: 50,
              height: 200.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              speakText('Hello, this is a .');
            },
            child: Image.asset(
              'lib/assest/hill.jpg', // Replace with the path to your image
              width: 50,
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> speakText(String text) async {
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    flutterTts.stop();

    super.dispose();
  }
}
