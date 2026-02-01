import 'package:flutter/material.dart';
import 'theme/mentra_theme.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MentraApp());
}

class MentraApp extends StatelessWidget {
  const MentraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mentra",
      debugShowCheckedModeBanner: false,
      theme: MentraTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}
