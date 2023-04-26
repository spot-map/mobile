package com.example.ride_map

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

import com.yandex.mapkit.MapKitFactory;

class MainActivity: FlutterActivity() {
    @Override
    fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine?) {
        MapKitFactory.setApiKey("6c405e92-4e46-4da7-805d-50a4d6d45ef7")
        super.configureFlutterEngine(flutterEngine)
    }
}
