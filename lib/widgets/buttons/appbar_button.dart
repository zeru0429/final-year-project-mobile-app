// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import '../../providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const RoundedBorderWithIcon(icon: Icons.arrow_back),
    );
  }
}

class RoundedBorderWithIcon extends StatelessWidget {
  const RoundedBorderWithIcon(
      {super.key, required this.icon, this.width, this.height});
  final IconData icon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 30,
      height: height ?? 30,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 3,
          color: Provider.of<ThemeProvider>(context)
              .themeData
              .colorScheme
              .secondary,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 20,
          color: Provider.of<ThemeProvider>(context)
              .themeData
              .colorScheme
              .secondary,
        ),
      ),
    );
  }
}
