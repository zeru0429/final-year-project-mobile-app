// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/screens/user/chat/conversation.dart';
import 'package:mobile/screens/user/chat/conversation_2.dart';
import 'package:mobile/widgets/chat/message.dart';
import 'package:mobile/widgets/chat/online_user_profile.dart';
import 'package:provider/provider.dart';

class OnlineUser extends StatelessWidget {
  final String userName;
  final String image;

  const OnlineUser({
    super.key,
    required this.userName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConversationScreen()
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
            Text(
              userName,
              style: GoogleFonts.lato(
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .primary,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
