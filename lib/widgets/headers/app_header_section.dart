import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/socket_provider.dart';
import 'package:mobile/providers/theme_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class AppHeaderSection extends StatelessWidget {
  final String title;
  final bool? messagingPage;
  final Widget? widget;
  const AppHeaderSection(
      {super.key, this.widget, required this.title, this.messagingPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<ThemeProvider>(context).themeData.colorScheme.surface,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (messagingPage != null)
              ? Row(children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Provider.of<SocketProvider>(context).getStatus ==
                              SocketStatus.connected
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    title,
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .secondary,
                    ),
                  ),
                ])
              : Text(
                  title,
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .secondary,
                  ),
                ),
          widget!
        ],
      ),
    );
  }
}
