import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dukkantek_test/constants/constants.dart';
import 'package:flutter/material.dart';

class TextBeatyAnimationWidget extends StatefulWidget {
  final String text;
  const TextBeatyAnimationWidget({Key? key,required this.text}) : super(key: key);

  @override
  _TextBeatyAnimationWidgetState createState() => _TextBeatyAnimationWidgetState();
}

class _TextBeatyAnimationWidgetState extends State<TextBeatyAnimationWidget> {


  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style:  appTextStyle.hugeTSBasic.copyWith(
       color: AppColors.mainColor
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(widget.text),
        ],
        isRepeatingAnimation: true,

        onTap: () {
          // print("Tap Event");
        },
      ),
    );
  }
}
