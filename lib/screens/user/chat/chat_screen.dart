// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobile/data/app_data.dart';
import 'package:mobile/providers/socket_provider.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/screens/user/chat/new_message.dart';
import 'package:mobile/util/shared_preferences.dart';
import 'package:mobile/widgets/chat/chat_users_section.dart';
import 'package:mobile/widgets/chat/online_user.dart';
import 'package:mobile/widgets/form/search_box.dart';
import 'package:mobile/widgets/headers/app_header_section.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mobile/localization/locals.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    _getSocketConnection();
  }

  void _getSocketConnection() {
    getToken().then((value) => {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Provider.of<SocketProvider>(context, listen: false).connect(value!);
          })
        });
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print(Provider.of<SocketProvider>(context, listen: false).getStatus);
    });
  }

  final onlineUsers = List.generate(
    AppData.onlineUsers.length,
    (index) => OnlineUser(
      image: AppData.onlineUsers[index]['profileImage'],
      userName: AppData.onlineUsers[index]['name'],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.99,
          height: MediaQuery.of(context).size.height * 0.205,
          child: Column(
            children: [
              AppHeaderSection(
                title: LocaleData.chat.getString(context),
                key: UniqueKey(),
                messagingPage: true,
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
              const SizedBox(
                height: 10,
              ),
              const SearchBox(placeholder: 'username'),
              const SizedBox(
                height: 10,
              ),
              SelectionTab(
                title: "DIRECT MESSAGES",
                page: NewMessageScreen(),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.99,
          height: MediaQuery.of(context).size.height * 0.655,
          child: SingleChildScrollView(
            child: Column(
              children: [...onlineUsers],
            ),
          ),
        ),
      ],
    );
  }
}
