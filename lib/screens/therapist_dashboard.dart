import 'package:flutter/material.dart';
import '../theme/mentra_theme.dart';

class TherapistDashboard extends StatelessWidget {
  final Map<String, dynamic> handoffData;

  const TherapistDashboard({super.key, required this.handoffData});

  @override
  Widget build(BuildContext context) {
    final themes = handoffData["common_themes"] as List<dynamic>;
    final plan = handoffData["session_plan"] as List<dynamic>;
    final logistics = handoffData["logistics"];

    return Scaffold(
      appBar: AppBar(title: const Text("Therapist Handoff")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Group: ${handoffData["group_type"]}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MentraColors.primaryMint,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Members: ${handoffData["member_count"]}",
              style: const TextStyle(color: MentraColors.textLight),
            ),

            const SizedBox(height: 20),

            const Text(
              "Common Themes",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...themes.map((t) => ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: Text(t),
                )),

            const SizedBox(height: 20),

            const Text(
              "Session Plan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...plan.map((p) => ListTile(
                  leading: const Icon(Icons.arrow_right),
                  title: Text(p),
                )),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                title: const Text("Logistics"),
                subtitle: Text(
                  "Suggested Time: ${logistics["suggested_time"]}\n"
                  "Payment Status: ${logistics["payment_status"]}",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
