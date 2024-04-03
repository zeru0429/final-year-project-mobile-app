import 'package:flutter/material.dart';
import 'package:mobile/model/news/news_model.dart';
import 'package:mobile/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  List<News> _news = [];
  //get
  List<News> get getNews => _news;
  //set
  set setNews(List<News> news) {
    _news = news;
    notifyListeners();
  }

  Future<List<News>> fetchNews() async {
    NewsService newsService = NewsService();
    List<Map<String, dynamic>> data = await newsService.fechNews();
    _news = data.map((json) => News.fromJson(json)).toList();
    notifyListeners();
    return _news;
  }
}
