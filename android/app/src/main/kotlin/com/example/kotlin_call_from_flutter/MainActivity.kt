package com.example.kotlin_call_from_flutter

import kotlin.random.Random
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.annotation.NonNull as NonNull1

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull1 flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "example.com/channel"
        ).setMethodCallHandler { call, result ->
            if (call.method == "getRandom") {
                val rand = ('f'..'j').shuffled().take(4).joinToString("")
                result.success(rand)
            } else {
                result.notImplemented()
            }
        }
    }
}
