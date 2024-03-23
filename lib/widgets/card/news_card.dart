// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/screens/user/home/news_detail.dart';
import 'package:mobile/widgets/carousel/banner_carousel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    super.key,
    required this.images,
    required this.title,
    required this.description,
    required this.date,
  });
  final List<String> images;
  final String title;
  final String description;
  final DateTime date;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  late FlutterLocalization _flutterLocalization;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NewsDetailScreen(
                imageUrl: widget.images,
                title: widget.title,
                description: widget.description,
                date: widget.date,
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          gradient: LinearGradient(colors: [
            Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .background,
            Provider.of<ThemeProvider>(context).themeData.colorScheme.onPrimary,
          ]),
          border: Border.all(
            color: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .onBackground,
            style: BorderStyle.solid,
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostCarousel(
              images: widget.images,
            ),
            Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .onSurface,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      formatDateTime(widget.date),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String formatDateTime(DateTime dateTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inMinutes < 1) {
    return 'Just now';
  } else if (difference.inHours < 1) {
    return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 1) {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
  } else {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}
