// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatefulWidget {
  final String placeholder;

  final TextEditingController? controller;
  const SearchBox({
    super.key,
    required this.placeholder,
    this.controller,
  });

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: GoogleFonts.lato(
        fontSize: 20,
        color:
            Provider.of<ThemeProvider>(context).themeData.colorScheme.secondary,
      ),
      onTap: () {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.search,
            color: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .primary,
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {
            widget.controller!.text = "";
          },
          child: Icon(
            FontAwesomeIcons.solidTimesCircle,
            color: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .primary,
            size: 20,
          ),
        ),
        hintText: widget.placeholder,
        hintStyle: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color:
              Provider.of<ThemeProvider>(context).themeData.colorScheme.primary,
        ),
        filled: true,
        fillColor: Provider.of<ThemeProvider>(context)
            .themeData
            .colorScheme
            .background,
      ),
    );
  }
}

        // enabledBorder: UnderlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(color: HexColor.fromHex("3C3E49")),
        // ),
        // focusedBorder: UnderlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(color: HexColor.fromHex("BEF0B2")),
        // ),