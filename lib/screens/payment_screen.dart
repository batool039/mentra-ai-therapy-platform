import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'confirmation_screen.dart';

class PaymentScreen extends StatelessWidget {
  final String groupId;
  const PaymentScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              "Confirm your spot",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "Mock payment via Stripe Sandbox.",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              child: const Text("Pay & Reserve Spot"),
              onPressed: () async {
                await ApiService.pay(groupId);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ConfirmationScreen(),
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
