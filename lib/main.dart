import 'package:flutter/material.dart';
import 'package:movies/src/app.dart';
import 'package:movies/src/core/di/injection_container.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initDependencies();
  runApp(const MoviesApp());
}