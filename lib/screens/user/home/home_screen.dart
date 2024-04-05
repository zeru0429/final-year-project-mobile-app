// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/providers/news_provider.dart';
import 'package:mobile/services/news_service.dart';
import 'package:mobile/widgets/card/news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsService newsService = NewsService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'end of the news please pull to reload',
              style: TextStyle(
                color: Color.fromARGB(118, 213, 0, 0),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            ...Provider.of<NewsProvider>(context).getNews.map(
                  (item) => NewsCard(
                    news: item,
                  ),
                )
          ],
        ),
      ),
    );
  }
}
