import 'dart:convert';

import 'package:mobile/config/server_instance.dart';
import 'package:mobile/util/shared_preferences.dart';

class AuthService {
  Future<Map<String, dynamic>> signInService(
      Map<String, dynamic> jsonData) async {
    final url = Uri.parse(
        'https://final-year-project-backend.onrender.com/api/admin/login');
    final jsonString = jsonEncode(jsonData);

    final res = await ServerInstance.getClient().post(
      url,
      headers: ServerInstance.headers,
    );

    print(res.body);
    // try {
    //   // send request to server
    //   final response = await ServerInstance.getClient().post(
    //     url,
    //     headers: ServerInstance.headers,
    //     body: jsonString,
    //   );

    //   //  handle response
    //   final Map<String, dynamic> responseData = json.decode(response.body);
    //   print(responseData);
    //   if (response.statusCode == 200) {
    //     final String token = responseData['token'];
    //     await saveToken(token);

    //     return {'success': true, 'message': 'Sign in successful'};
    //   } else {
    //     print('POST request failed with status: ${response.statusCode}');
    //     print(responseData['message']);
    //     return {'success': false, 'message': responseData['message']};
    //   }
    // } catch (e) {
    //   print(e);
    //   print('Error sending POST request: $e');
    //   return {'success': false, 'message': 'An error occurred'};
    // }
    return {};
  }
}
