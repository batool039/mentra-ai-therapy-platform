import 'package:flutter/material.dart';
import '../theme/mentra_theme.dart';
import '../services/api_service.dart';
import 'match_result_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = [
    {"bot": "Hi, I’m Mentra 🌱. What’s been on your mind lately?"}
  ];

  final TextEditingController controller = TextEditingController();
  bool loading = false;

  Future<void> sendMessage() async {
    if (controller.text.isEmpty) return;

    setState(() {
      messages.add({"user": controller.text});
      controller.clear();
      loading = true;
    });

    try {
      // ✅ Call backend AI analysis
      final result = await ApiService.analyzeUser(messages);

      // ✅ Correct keys from backend response
      String groupId = result["assigned_group"];
      String groupType = result["group_type"];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MatchResultScreen(
            groupId: groupId,
            matchedGroup: groupType,
            therapistHandoff: result["therapist_handoff"],
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Backend error: $e")),
      );
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mentra Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (_, i) {
                final msg = messages[i];
                final isUser = msg.containsKey("user");

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isUser
                          ? MentraColors.primaryMint
                          : MentraColors.mintSoft,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      isUser ? msg["user"]! : msg["bot"]!,
                      style: TextStyle(
                        color: isUser ? Colors.white : MentraColors.textDark,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          if (loading)
            const Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send,
                      color: MentraColors.primaryMint),
                  onPressed: sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
