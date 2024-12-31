import 'package:alpas/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:translator/translator.dart';

class TextToText extends StatefulWidget {
  const TextToText({super.key});

  @override
  State<TextToText> createState() => _TextToTextState();
}

class _TextToTextState extends State<TextToText> {
  final TextEditingController _textController = TextEditingController();
  final translator = GoogleTranslator();
  String translatedText = 'Translation';

  void translateText(String text) {
    translator.translate(text, to: 'ne').then((value) {
      setState(() {
        translatedText = value.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Text to Text'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    './assets/images/person.png',
                    height: 200,
                    width: 200,
                  ),
                  Positioned(
                    bottom: -30,
                    right: 0,
                    child: Lottie.asset(
                        './assets/images/speech-animation-light.json',
                        width: 200,
                        height: 100),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                translatedText,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: DeviceUtils.getScreenWidth(context) * 0.74,
                    child: TextField(
                      onSubmitted: (value) => DeviceUtils.hideKeyboard(context),
                      controller: _textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Enter text',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () => translateText(_textController.text),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 53,
                            width: 53,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorLight,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(Icons.arrow_right_alt_outlined)),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
