// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:mobile/config/server_instance.dart';
import 'package:mobile/util/shared_preferences.dart';

class AuthService {
  //login
  Future<Map<String, dynamic>> signInService(
      Map<String, dynamic> jsonData) async {
    final url = Uri.parse('${ServerInstance.baseUrl}/user/login');
    final jsonString = jsonEncode(jsonData);
    // now send api request
    try {
      //send api request
      final response = await ServerInstance.getClient().post(
        url,
        headers: ServerInstance.headers,
        body: jsonString,
      );
      //handle response
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String token = responseData['token'];
        await saveToken(token);
        return {'success': true, 'message': 'Sign in successful'};
      } else {
        //incorrect password or no account
      }
    } catch (e) {
      print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      print(e.toString());
    } finally {}
    return {'success': false, 'message': 'Sign in failed'};
  }

  //me using auth
  Future<Map<String, dynamic>> meService() async {
    final url = Uri.parse('${ServerInstance.baseUrl}/user/me/myInfo');
    await ServerInstance.updateHeadersWithToken();
    final resquest = await ServerInstance.getClient().get(
      url,
      headers: ServerInstance.headers,
    );
    if (resquest.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(resquest.body);
      return responseData;
    } else {
      //incorrect token or user not found
      print(resquest.body);
    }
    return {'success': false, 'message': ' no valid or expired token '};
  }

  Future<List<Map<String, dynamic>>> getConversation(int chatId) async {
    print('${ServerInstance.baseUrl}/chat//message/$chatId');
    final url = Uri.parse('${ServerInstance.baseUrl}/chat/message/$chatId');
    await ServerInstance.updateHeadersWithToken();
    final resquest = await ServerInstance.getClient().get(
      url,
      headers: ServerInstance.headers,
    );
    print(resquest.statusCode);
    if (resquest.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(resquest.body);
      print(responseData);
      return responseData['data'];
    }
    return [];
  }
}
