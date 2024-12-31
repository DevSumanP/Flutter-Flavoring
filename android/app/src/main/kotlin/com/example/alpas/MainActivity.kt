package com.example.alpas

import android.os.Bundle
import android.speech.tts.TextToSpeech
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.Locale


class MainActivity : FlutterActivity(), TextToSpeech.OnInitListener {
    private var tts: TextToSpeech? = null
    private val CHANNEL = "com.example.alpas/tts"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "speak") {
                val text = call.argument<String>("text")
                if (text != null) {
                    speak(text, result)
                } else {
                    result.error("INVALID_ARGUMENT", "Text is null", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        tts = TextToSpeech(this, this)
    }

    private fun speak(text: String, result: MethodChannel.Result) {
        tts?.let {
            it.language = Locale.US
            val status = it.speak(text, TextToSpeech.QUEUE_FLUSH, null, null)
            if (status == TextToSpeech.SUCCESS) {
                result.success(null)
            } else {
                result.error("TTS_ERROR", "Speaking failed", null)
            }
        } ?: run {
            result.error("TTS_ERROR", "TTS not initialized", null)
        }
    }

    override fun onInit(status: Int) {
        if (status == TextToSpeech.SUCCESS) {
            tts?.language = Locale.US
        }
    }

    override fun onDestroy() {
        tts?.shutdown()
        super.onDestroy()
    }
}
