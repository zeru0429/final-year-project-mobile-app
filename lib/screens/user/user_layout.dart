// ignore_for_file: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile/localization/locals.dart';
import 'package:mobile/providers/auth.dart';
import 'package:mobile/providers/news_provider.dart';
import 'package:mobile/providers/socket_provider.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/screens/user/card/smart_card.dart';
import 'package:mobile/screens/user/chat/chat_screen.dart';
import 'package:mobile/screens/user/home/home_screen.dart';
import 'package:mobile/screens/user/notification/notification_screen.dart';
import 'package:mobile/screens/user/setting/settings_screen.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:mobile/util/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:mobile/config/server_instance.dart';

class UserAppLayout extends StatefulWidget {
  const UserAppLayout({super.key});

  @override
  State<UserAppLayout> createState() => _UserAppLayoutState();
}

class _UserAppLayoutState extends State<UserAppLayout> {
  int _currentPage = 0;
  late IO.Socket _socket;
  final TextEditingController _messageInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<NewsProvider>(context, listen: false).fetchNews();
    });
    getToken().then((value) => {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Provider.of<SocketProvider>(context, listen: false).connect(value!);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    const pages = [
      HomeScreen(),
      NotificationScreen(),
      ChatScreen(),
      CardReader(),
      ProfileScreen()
    ];

    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: pages[_currentPage]),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 23,
          unselectedItemColor:
              Provider.of<ThemeProvider>(context).themeData.colorScheme.primary,
          selectedItemColor: Provider.of<ThemeProvider>(context)
              .themeData
              .colorScheme
              .secondary,
          backgroundColor: Provider.of<ThemeProvider>(context)
              .themeData
              .colorScheme
              .onBackground,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: LocaleData.home.getString(context),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.notifications),
              label: LocaleData.notification.getString(context),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.inbox),
              label: LocaleData.chat.getString(context),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.nfc),
              label: LocaleData.home.getString(context),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: LocaleData.settings.getString(context),
            ),
          ],
          currentIndex: _currentPage,
          onTap: (value) {
            setState(() {
              _currentPage = value;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: 1,
                channelKey: "basic_channel",
                title: "Hello world!",
                body: "Yay! I have local notifications working now!",
                category: NotificationCategory.Call,
                actionType: ActionType.Default,
                autoDismissible: true,
                color: Colors.red,
                backgroundColor: Colors.lightBlue,
                displayOnBackground: true,
                displayOnForeground: true,
                badge: 3,
                bigPicture: 'assets/images/logo.avif',
                fullScreenIntent: true,
                showWhen: true,
                locked: true,
                notificationLayout: NotificationLayout.Default,
                wakeUpScreen: true,
                summary: 'here is the summery',
                chronometer: const Duration(
                  seconds: 3,
                ),
                hideLargeIconOnExpand: true,
                criticalAlert: true,
                progress: 1,
                timeoutAfter: const Duration(
                  seconds: 10,
                ),
              ),
            );
          },
          child: const Icon(
            Icons.notification_add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
