// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class PostBottomWidget extends StatefulWidget {
  final String label;
  const PostBottomWidget({
    required this.label,
    super.key,
  });

  @override
  State<PostBottomWidget> createState() => _PostBottomWidgetState();
}

class _PostBottomWidgetState extends State<PostBottomWidget> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        width: MediaQuery.of(context).size.width * 0.99,
        decoration: BoxDecoration(
          color:
              Provider.of<ThemeProvider>(context).themeData.colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Transform.rotate(
              //   angle: 195.2,
              //   child: Container(
              //     width: 50,
              //     height: 50,
              //     decoration: BoxDecoration(
              //         color: Provider.of<ThemeProvider>(context)
              //             .themeData
              //             .colorScheme
              //             .primary,
              //         shape: BoxShape.circle),
              //     child: const Icon(
              //       Icons.attach_file,
              //       color: Colors.white,
              //       size: 30,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   width: 20,
              // ),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: widget.label,
                  hintStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .primary,
                  ),
                  filled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//  Text(
//                 label,
//                 style: GoogleFonts.lato(
//                   color: Colors.white,
//                 ),
//               )