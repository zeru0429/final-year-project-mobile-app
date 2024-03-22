// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:provider/provider.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String currentLocale,
  required Function(String?) onLocaleChanged,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    actions: [
      IconButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        },
        icon: Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) => Icon(
            themeProvider.isNightMode ? Icons.dark_mode : Icons.light_mode,
            color: themeProvider.themeData.colorScheme.secondary,
          ),
        ),
      ),
      DropdownButton(
        value: currentLocale,
        items: const [
          DropdownMenuItem(
            value: "en",
            child: Text("English"),
          ),
          DropdownMenuItem(
            value: "am",
            child: Text("አማርኛ"),
          ),
          DropdownMenuItem(
            value: "or",
            child: Text("afan-oromoo"),
          ),
        ],
        onChanged: onLocaleChanged,
      )
    ],
  );
}
