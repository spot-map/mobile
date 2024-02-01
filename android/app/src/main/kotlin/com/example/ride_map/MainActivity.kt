package com.example.ride_map

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    @Override
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("6c405e92-4e46-4da7-805d-50a4d6d45ef7")
        super.configureFlutterEngine(flutterEngine)

    }
}
