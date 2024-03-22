// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ProfileTextOption extends StatefulWidget {
  final String label;

  final IconData icon;
  final double? margin;

  const ProfileTextOption(
      {super.key, required this.label, required this.icon, this.margin});

  @override
  State<ProfileTextOption> createState() => _ProfileTextOptionState();
}

class _ProfileTextOptionState extends State<ProfileTextOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context)
            .themeData
            .colorScheme
            .background,
        border: Border.all(
          color: Provider.of<ThemeProvider>(context)
              .themeData
              .colorScheme
              .secondary,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: widget.margin ?? 5.0), // 8.0 as default margin.
            child: ListTile(
              title: Row(
                children: [
                  Icon(
                    widget.icon,
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .primary,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.label,
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .secondary,
                    ),
                  ),
                ],
              ),
              trailing: const SizedBox(),
            ),
          ),
          Divider(
            height: 1,
            color: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .secondary,
          ),
        ],
      ),
    );
  }
}
