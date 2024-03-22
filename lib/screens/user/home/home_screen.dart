// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/localization/locals.dart';
import 'package:mobile/widgets/card/news_card.dart';
import 'package:flutter_localization/flutter_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            NewsCard(
              title: 'title odf the news',
              description:
                  "Business woman, manager or Human Resources portrait for career success, company we are hiring or job and work opportunity. Entrepreneur or corporate hr employee happy face for internship with mock up stock photo",
              date: DateTime.now(),
              images: const [
                "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg",
                "https://cdn.mos.cms.futurecdn.net/Nxz3xSGwyGMaziCwiAC5WW-1024-80.jpg",
                "https://images.pexels.com/photos/2635817/pexels-photo-2635817.jpeg?auto=compress&crop=focalpoint&cs=tinysrgb&fit=crop&fp-y=0.6&h=500&sharp=20&w=1400",
              ],
            ),
            NewsCard(
              title: 'title odf the news',
              description:
                  "Business woman, manager or Human Resources portrait for career success, company we are hiring or job and work opportunity. Entrepreneur or corporate hr employee happy face for internship with mock up stock photo",
              date: DateTime(2024, 3, 21, 02, 40, 20),
              images: const [
                "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg",
                "https://cdn.mos.cms.futurecdn.net/Nxz3xSGwyGMaziCwiAC5WW-1024-80.jpg",
                "https://images.pexels.com/photos/2635817/pexels-photo-2635817.jpeg?auto=compress&crop=focalpoint&cs=tinysrgb&fit=crop&fp-y=0.6&h=500&sharp=20&w=1400",
              ],
            ),
            NewsCard(
              title: 'title odf the news',
              description:
                  "Business woman, manager or Human Resources portrait for career success, company we are hiring or job and work opportunity. Entrepreneur or corporate hr employee happy face for internship with mock up stock photo",
              date: DateTime.now(),
              images: const [
                "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg",
                "https://cdn.mos.cms.futurecdn.net/Nxz3xSGwyGMaziCwiAC5WW-1024-80.jpg",
                "https://images.pexels.com/photos/2635817/pexels-photo-2635817.jpeg?auto=compress&crop=focalpoint&cs=tinysrgb&fit=crop&fp-y=0.6&h=500&sharp=20&w=1400",
              ],
            ),
            NewsCard(
              title: 'title odf the news',
              description:
                  "Business woman, manager or Human Resources portrait for career success, company we are hiring or job and work opportunity. Entrepreneur or corporate hr employee happy face for internship with mock up stock photo",
              date: DateTime(2024, 3, 21, 02, 40, 20),
              images: const [
                "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg",
                "https://cdn.mos.cms.futurecdn.net/Nxz3xSGwyGMaziCwiAC5WW-1024-80.jpg",
                "https://images.pexels.com/photos/2635817/pexels-photo-2635817.jpeg?auto=compress&crop=focalpoint&cs=tinysrgb&fit=crop&fp-y=0.6&h=500&sharp=20&w=1400",
              ],
            ),
          ],
        ),
      ),
    );
  }
}
