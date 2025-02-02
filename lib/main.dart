import 'package:flutter/material.dart';
import 'package:movies/src/app.dart';
import 'package:movies/src/core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MoviesApp());
}