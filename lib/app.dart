import 'package:alpas/features/authentication/screens/homescreen/homescreen.dart';
import 'package:alpas/features/text-to-text/text-to-text.dart';
import 'package:alpas/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: HomeScreen(),
    );
  }
}
