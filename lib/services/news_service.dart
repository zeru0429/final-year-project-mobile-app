// ignore_for_file: unused_local_variable, avoid_print, unused_import

import 'dart:convert';
import 'package:mobile/config/server_instance.dart';
import 'package:mobile/util/shared_preferences.dart';

class NewsService {
  Future<List<Map<String, dynamic>>> fechNews() async {
    // prepare request
    final url = Uri.parse('${ServerInstance.baseUrl}/news');
    try {
      //send request
      final response = await ServerInstance.getClient().get(url);
      final List<dynamic> responseData = json.decode(response.body);
      final List<Map<String, dynamic>> newsList =
          List<Map<String, dynamic>>.from(responseData);
      return newsList;
    } catch (error) {}

    return [];
  }
}
