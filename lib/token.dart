import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String?> getToken() async {
  final String url = "http://project-management.test/api/get-token";

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String token = data['token'];
      print("Token: $token");
      return token;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("Exception: $e");
    return null;
  }
}
