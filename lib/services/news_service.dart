// ignore_for_file: unused_local_variable, avoid_print, unused_import

import 'dart:convert';
import 'package:mobile/config/server_instance.dart';
import 'package:mobile/util/shared_preferences.dart';

class NewsService {
  Future<List<Map<String, dynamic>>> fechNews(int skip, int take) async {
    // prepare request
    print('${ServerInstance.baseUrl}/news?skip=$skip&take=$take');
    final url =
        Uri.parse('${ServerInstance.baseUrl}/news?skip=$skip&take=$take');
    try {
      //send request
      final response = await ServerInstance.getClient().get(url);
      print(response.statusCode);
      final List<dynamic> responseData = json.decode(response.body);
      final List<Map<String, dynamic>> newsList =
          List<Map<String, dynamic>>.from(responseData);
      return newsList;
    } catch (error) {}

    return [];
  }
}
