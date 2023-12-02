import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/di/di.dart' as di;

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      di.setup();
      runApp(
        const App(),
      );
    },
    (error, stack) {
      log('Error: $error');
      log('StackTrace: $stack');
    },
  );
}
