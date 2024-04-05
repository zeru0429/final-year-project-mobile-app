import 'package:http/http.dart' as http;
import 'package:mobile/util/shared_preferences.dart';

class ServerInstance {
  static const String baseUrl =
      'https://final-year-project-backend.onrender.com/api';
  static const String socketUrl = 'https://final-year-project-backend.onrender.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static http.Client client = http.Client();

  static http.Client getClient() {
    return client;
  }

  static Future<void> updateHeadersWithToken() async {
    final token = await getToken();
    if (token != null) {
      headers['authorization'] = token;
    } else {
      headers.remove('authorization');
    }
  }
}
