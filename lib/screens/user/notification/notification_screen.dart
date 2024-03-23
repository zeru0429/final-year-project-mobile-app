// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/screens/user/notification/notification_detail_screen.dart';
import 'package:mobile/widgets/avators/circular_border.dart';
import 'package:mobile/widgets/card/notificaction_card.dart';
import 'package:mobile/widgets/headers/app_header_section.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mobile/localization/locals.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppHeaderSection(
                title: LocaleData.notification.getString(context),
                messagingPage: false,
                key: UniqueKey(),
                widget: OutlinedButton(
                  style: const ButtonStyle(),
                  onPressed: () {},
                  child: Text(
                    LocaleData.newChat.getString(context),
                    style: TextStyle(
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .secondary,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationDetaile()));
                },
                child: const NotificationCard(
                  read: true,
                  userName: 'mamo welde',
                  date: 'seb 21:2023',
                  mention: 'abebe',
                  mentioned: true,
                  userOnline: false,
                  message:
                      'opportunity. Entrepreneur or corporate hr employee happy face for internship with mock up stock photo',
                  image:
                      'https://images.unsplash.com/photo-1704137893004-353622b7ab14?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  imageBackground: 'Colors.black',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationDetaile()));
                },
                child: const NotificationCard(
                  read: true,
                  userName: 'mamo welde',
                  date: 'seb 21:2023',
                  mention: 'abebe',
                  mentioned: true,
                  userOnline: false,
                  message:
                      'opportunity. Entrepreneur or corporate hr employee happy face for internship with mock up stock photo',
                  image:
                      'https://images.unsplash.com/photo-1704137893004-353622b7ab14?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  imageBackground: 'Colors.black',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationDetaile()));
                },
                child: const NotificationCard(
                  read: true,
                  userName: 'mamo welde',
                  date: 'seb 21:2023',
                  mention: 'abebe',
                  mentioned: true,
                  userOnline: false,
                  message:
                      'opportunity. Entrepreneur or corporate hr employee happy face for internship with mock up stock photo',
                  image:
                      'https://images.unsplash.com/photo-1704137893004-353622b7ab14?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  imageBackground: 'Colors.black',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationDetaile()));
                },
                child: const NotificationCard(
                  read: true,
                  userName: 'mamo welde',
                  date: 'seb 21:2023',
                  mention: 'abebe',
                  mentioned: true,
                  userOnline: false,
                  message:
                      'opportunity. Entrepreneur or corporate hr employee happy face for internship with mock up stock photo',
                  image:
                      'https://images.unsplash.com/photo-1704137893004-353622b7ab14?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  imageBackground: 'Colors.black',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationDetaile()));
                },
                child: const NotificationCard(
                  read: true,
                  userName: 'mamo welde',
                  date: 'seb 21:2023',
                  mention: 'abebe',
                  mentioned: true,
                  userOnline: false,
                  message:
                      'opportunity. Entrepreneur or corporate hr employee happy face for internship with mock up stock photo',
                  image:
                      'https://images.unsplash.com/photo-1704137893004-353622b7ab14?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  imageBackground: 'Colors.black',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationDetaile()));
                },
                child: const NotificationCard(
                  read: true,
                  userName: 'mamo welde',
                  date: 'seb 21:2023',
                  mention: 'abebe',
                  mentioned: true,
                  userOnline: false,
                  message:
                      'opportunity. Entrepreneur or corporate hr employee happy face for internship with mock up stock photo',
                  image:
                      'https://images.unsplash.com/photo-1704137893004-353622b7ab14?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  imageBackground: 'Colors.black',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
