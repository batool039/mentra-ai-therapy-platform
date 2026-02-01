import 'package:flutter/material.dart';
import '../theme/mentra_theme.dart';
import 'scheduling_screen.dart';
import 'therapist_dashboard.dart';

class MatchResultScreen extends StatelessWidget {
  final String groupId;
  final String matchedGroup;
  final Map<String, dynamic> therapistHandoff;

  const MatchResultScreen({
    super.key,
    required this.groupId,
    required this.matchedGroup,
    required this.therapistHandoff,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Match")),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              "You’ve been matched with:",
              style: TextStyle(fontSize: 18, color: MentraColors.textLight),
            ),
            const SizedBox(height: 20),

            Text(
              matchedGroup,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MentraColors.primaryMint,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  "Group ID: $groupId\n\nThis group includes peers facing similar concerns.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: MentraColors.textDark),
                ),
              ),
            ),

            const Spacer(),

            ElevatedButton(
              child: const Text("Continue to Scheduling"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SchedulingScreen(groupId: groupId),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            TextButton(
              child: const Text("View Therapist Handoff Dashboard"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        TherapistDashboard(handoffData: therapistHandoff),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

