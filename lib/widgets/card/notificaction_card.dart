// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/widgets/avators/profile_avator_widget.dart';
import 'package:provider/provider.dart';

class NotificationCard extends StatefulWidget {
  final bool read;
  final String userName;
  final String date;
  final String mention;
  final bool mentioned;
  final String message;
  final String image;
  final String imageBackground;
  final bool userOnline;
  const NotificationCard(
      {super.key,
      required this.read,
      required this.userName,
      required this.date,
      required this.mention,
      required this.mentioned,
      required this.userOnline,
      required this.message,
      required this.image,
      required this.imageBackground});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 3),
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.userName} mentioned you in ${widget.mention}',
            style: GoogleFonts.lato(
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ProfileAvator(
                    dummyType: ProfileAvatorType.Image,
                    scale: 1.2,
                    image: widget.image,
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .secondary,
                  ),
                  widget.userOnline
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .onSecondary,
                            ),
                            child: Center(
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Provider.of<ThemeProvider>(context)
                                      .themeData
                                      .colorScheme
                                      .secondary,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          width: 7,
                          height: 7,
                        ),
                ],
              ),
              const SizedBox(
                width: 7,
                height: 7,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.userName,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .secondary,
                            ),
                          ),
                          Text(
                            widget.date,
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              color: widget.read
                                  ? Provider.of<ThemeProvider>(context)
                                      .themeData
                                      .colorScheme
                                      .primary
                                  : Provider.of<ThemeProvider>(context)
                                      .themeData
                                      .colorScheme
                                      .secondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      widget.mentioned
                          ? RichText(
                              text: TextSpan(
                                text: 'Hello ',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Provider.of<ThemeProvider>(context)
                                      .themeData
                                      .colorScheme
                                      .onSurface,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '@tranmautritam',
                                    style: GoogleFonts.lato(
                                      color: Provider.of<ThemeProvider>(context)
                                          .themeData
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ', ${widget.message}',
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                      color: Provider.of<ThemeProvider>(context)
                                          .themeData
                                          .colorScheme
                                          .primary,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Text(
                              widget.message,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Provider.of<ThemeProvider>(context)
                                    .themeData
                                    .colorScheme
                                    .primary,
                              ),
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Divider(
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
            ),
          ),
        ],
      ),
    );
  }
}
