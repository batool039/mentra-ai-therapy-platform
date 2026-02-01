import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.1.142:8000";

  // -----------------------------
  // Health Check
  // -----------------------------
  static Future<bool> checkHealth() async {
    final response = await http.get(Uri.parse("$baseUrl/health"));
    return response.statusCode == 200;
  }

  // -----------------------------
  // Analyze User Chat (AI Matching)
  // POST /analyze-user
  // -----------------------------
  static Future<Map<String, dynamic>> analyzeUser(
      List<Map<String, String>> messages) async {
    final response = await http.post(
      Uri.parse("$baseUrl/analyze-user"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"messages": messages}),
    );

    return jsonDecode(response.body);
  }

  // -----------------------------
  // Schedule Session
  // POST /schedule
  // -----------------------------
  static Future<Map<String, dynamic>> scheduleSession(
      String groupId, String slot) async {
    final response = await http.post(
      Uri.parse("$baseUrl/schedule"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "group_id": groupId,
        "slot": slot,
      }),
    );

    return jsonDecode(response.body);
  }

  // -----------------------------
  // Mock Payment
  // POST /pay
  // -----------------------------
  static Future<Map<String, dynamic>> pay(String groupId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/pay"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"group_id": groupId}),
    );

    return jsonDecode(response.body);
  }

  // -----------------------------
  // Therapist Group Brief
  // GET /group/{group_id}/brief
  // -----------------------------
  static Future<Map<String, dynamic>> getGroupBrief(String groupId) async {
    final response =
        await http.get(Uri.parse("$baseUrl/group/$groupId/brief"));

    return jsonDecode(response.body);
  }
}
