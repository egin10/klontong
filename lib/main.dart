import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:klontong/klontong_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Android
      statusBarIconBrightness: Brightness.light, // Android
      statusBarBrightness: Brightness.dark, // iOS
    ),
  );

  // Set Screen Orientation to Potrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Load Env
  await dotenv.load(fileName: '.env');

  runApp(KlontongApp());
}

