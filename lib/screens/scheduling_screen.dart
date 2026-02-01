import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'payment_screen.dart';

class SchedulingScreen extends StatelessWidget {
  final String groupId;
  const SchedulingScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    final slots = [
      "Monday • 6:00 PM",
      "Wednesday • 7:00 PM",
      "Friday • 5:00 PM"
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Choose a Session Time")),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: slots.length,
        itemBuilder: (_, i) {
          return Card(
            child: ListTile(
              title: Text(slots[i]),
              onTap: () async {
                await ApiService.scheduleSession(groupId, slots[i]);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PaymentScreen(groupId: groupId),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
