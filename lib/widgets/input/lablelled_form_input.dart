// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class LabelledFormInput extends StatefulWidget {
  final String label;
  final String placeholder;
  final String? value;
  final String keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  const LabelledFormInput({
    super.key,
    required this.placeholder,
    required this.keyboardType,
    required this.controller,
    required this.obscureText,
    required this.label,
    this.value,
  });

  @override
  State<LabelledFormInput> createState() => _LabelledFormInputState();
}

class _LabelledFormInputState extends State<LabelledFormInput> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .primary,
          ),
          onTap: () {},
          keyboardType: widget.keyboardType == "text"
              ? TextInputType.text
              : TextInputType.number,
          obscureText: !_obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 20,
            ),
            suffixIcon: widget.placeholder == "Password"
                ? InkWell(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.green.shade900,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      widget.controller.text = "";
                    },
                    child: Icon(
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.solidTimesCircle,
                      size: 20,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .secondary,
                    ),
                  ),
            hintText: widget.placeholder,
            hintStyle: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
            ),
            filled: false,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .secondary,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .secondary,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .secondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
