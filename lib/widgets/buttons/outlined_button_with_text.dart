// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class OutlinedButtonWithText extends StatefulWidget {
  final String content;
  final double width;
  final VoidCallback? onPressed;
  const OutlinedButtonWithText(
      {super.key, required this.content, required this.width, this.onPressed});

  @override
  State<OutlinedButtonWithText> createState() => _OutlinedButtonWithTextState();
}

class _OutlinedButtonWithTextState extends State<OutlinedButtonWithText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 45,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Provider.of<ThemeProvider>(context).themeData.colorScheme.primary,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .secondary,
                width: 2,
              ),
            ),
          ),
        ),
        child: Center(
          child: Text(
            widget.content,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
