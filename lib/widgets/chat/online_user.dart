// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/model/user/user_auth_model.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/screens/user/chat/conversation_2.dart';
import 'package:mobile/widgets/chat/online_user_profile.dart';
import 'package:provider/provider.dart';

class OnlineUser extends StatelessWidget {
  final String userName;
  final String image;
  final int id;
  final MessageModel? lastMessage;

  const OnlineUser(
      {super.key,
      required this.userName,
      required this.image,
      required this.id,
      this.lastMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConversationScreen(
                      chatId: id,
                    )
                // MessagingScreen(userName: 'aster aweke', image: image),
                ),
          );
        },
        child: Row(
          children: [
            OnlineUserProfile(
              image: image,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: GoogleFonts.lato(
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                lastMessage != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            lastMessage!.content,
                            style: GoogleFonts.lato(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .onSurface,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            formatDateTime(lastMessage!.sentTime),
                            style: GoogleFonts.lato(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .onSurface,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
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
