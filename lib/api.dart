import 'dart:convert';

import 'package:http/http.dart';

const String url = "http://146.185.154.90:8000/messages";

Future<dynamic> fetchMessages(DateTime? lastMessageDateTime) async {
  final uri = lastMessageDateTime != null
      ? Uri.parse('${url}?datetime=${lastMessageDateTime.toIso8601String()}')
      : Uri.parse(url);

  try {
    final response = await get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData;
    }
  } catch (error) {
    return [];
  }
}