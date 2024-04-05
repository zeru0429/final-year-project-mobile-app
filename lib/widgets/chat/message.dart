// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/widgets/chat/online_user.dart';
import 'package:provider/provider.dart';

class SentImage extends StatelessWidget {
  final String image;
  const SentImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
              width: 200, fit: BoxFit.fitWidth, image: NetworkImage(image))),
    );
  }
}

class SenderMessage extends StatelessWidget {
  final String message;
  const SenderMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 250,
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
            decoration: BoxDecoration(
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              message,
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessengerDetails extends StatelessWidget {
  const MessengerDetails({
    super.key,
    required this.image,
    required this.userName,
  });

  final String image;

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          OnlineUser(
            id: 12,
            image: image,
            userName: userName,
          ),
          const SizedBox(
            width: 10,
          ),
          const TimeReceipt(time: "12:11 PM")
        ],
      ),
    );
  }
}

class TimeReceipt extends StatelessWidget {
  final String time;
  const TimeReceipt({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Text(time, style: GoogleFonts.lato(color: Colors.white));
  }
}
