import 'package:flutter/material.dart';
import '../theme/mentra_theme.dart';
import 'chat_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            CircleAvatar(
              radius: 50,
              backgroundColor: MentraColors.mintSoft,
              child: Image.asset(
                "assets/logo.jpg",
                height: 70,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Welcome to Mentra 🌱",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: MentraColors.textDark,
              ),
            ),

            const SizedBox(height: 14),

            const Text(
              "A safe space to match you with supportive group therapy sessions.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: MentraColors.textLight,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: const [
                    Text(
                      "Before we begin:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: MentraColors.textDark,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Your responses will only be used to match you with the right support group and therapist.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: MentraColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            ElevatedButton(
              child: const Text("I Agree & Start"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ChatScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
