import 'package:alpas/config/flavor_config.dart';
import 'package:alpas/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  late Future<void> _initFuture;

  final TextEditingController _textController = TextEditingController();
  static const platform = MethodChannel('com.example.alpas/tts');

  Future<void> speak(String text) async {
    try {
      await platform.invokeMethod('speak', {'text': text});
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
    }
  }

  @override
  void initState() {
    super.initState();
    _initFuture = AppConfig.initialize(); // Make sure the flavor is initialized
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final isPaid = AppConfig.isPaid();
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text('Text to Speech'),
              ),
              body: (isPaid)
                  ? Padding(
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
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    DeviceUtils.getScreenWidth(context) * 0.74,
                                child: TextField(
                                  controller: _textController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    hintText: 'Enter text to speak.....',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () => speak(_textController.text),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height: 53,
                                        width: 53,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Icon(
                                            Icons.arrow_right_alt_outlined)),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Text('Upgrade to Pro to access this feature'),
                    ),
            ),
          );
        }
      },
    );
  }
}
