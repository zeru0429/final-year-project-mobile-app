import 'package:flutter/material.dart';
import 'package:mobile/model/news/news_model.dart';
import 'package:mobile/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  List<News> _news = [];
  bool _isLoading = false;
  //get
  List<News> get getNews => _news;
  bool get isLoading => _isLoading;
  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;
  //set
  set setNews(List<News> news) {
    _news = news;
    notifyListeners();
  }

  Future<List<News>> fetchNews() async {
    _isLoading = true;
    notifyListeners();
    NewsService newsService = NewsService();
    List<Map<String, dynamic>> data = await newsService.fechNews(0, 5);
    _news.insertAll(0, data.map((json) => News.fromJson(json)).toList());
    _isLoading = false;
    notifyListeners();
    return _news;
  }

  Future<List<News>> fetchMoreNews() async {
    if (_isLoadingMore) return _news; // Prevent multiple simultaneous requests
    _isLoadingMore = true;
    notifyListeners();
    NewsService newsService = NewsService();
    List<Map<String, dynamic>> data =
        await newsService.fechNews(_news.length, 5);
    _news.addAll(data.map((json) => News.fromJson(json)).toList());
    _isLoadingMore = false;
    notifyListeners();
    return _news;
  }
}
