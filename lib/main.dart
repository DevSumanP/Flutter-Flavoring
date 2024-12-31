import 'package:alpas/app.dart';
import 'package:alpas/config/flavor_config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.initialize();
  runApp(const App());
}
