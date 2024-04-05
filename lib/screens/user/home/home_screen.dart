import 'package:flutter/material.dart';
import 'package:mobile/providers/news_provider.dart';
import 'package:mobile/widgets/card/news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, _) {
        return RefreshIndicator(
          onRefresh: () => newsProvider.fetchNews(),
          child: Column(
            children: [
              if (newsProvider.isLoading && newsProvider.getNews.isEmpty)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: newsProvider.getNews.length + 1, // +1 for footer
                  itemBuilder: (BuildContext context, int index) {
                    if (index < newsProvider.getNews.length) {
                      final item = newsProvider.getNews[index];
                      return NewsCard(news: item);
                    } else {
                      return _buildFooter(newsProvider);
                    }
                  },
                ),
              ),
              if (newsProvider.isLoading && newsProvider.getNews.isNotEmpty)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFooter(NewsProvider newsProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: newsProvider.isLoadingMore
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () => newsProvider.fetchMoreNews(),
                child: const Text('Load More'),
              ),
      ),
    );
  }

  void _scrollListener() {
    final newsProvider = Provider.of<NewsProvider>(context, listen: false);
    // Prevent fetching when already loading
    if (newsProvider.isLoading) {
      return;
    }
    // When we reach the end of the list
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        newsProvider.fetchMoreNews();
      });
    } // When we reach the start of the list
    else if (scrollController.position.pixels ==
        scrollController.position.minScrollExtent) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        newsProvider.fetchNews();
      });
    }
  }
}
