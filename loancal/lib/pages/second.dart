import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
      body:Container(
      child: SizedBox(
        width: 250.0,
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontFamily: 'Agne',
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Discipline is the best tool'),
              TypewriterAnimatedText('Design first, then code'),
              TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
              TypewriterAnimatedText('Do not test bugs out, design them out'),
            ],
            totalRepeatCount: 4,
            pause: const Duration(milliseconds: 2000),
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ),
      ),
    );
  }
}
