import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/widgets/avators/circular_border.dart';
import 'package:provider/provider.dart';

class SelectionTab extends StatelessWidget {
  final String title;
  final StatelessWidget? page;
  const SelectionTab({super.key, required this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .primary,
            )),
        InkWell(
          onTap: () {
            Get.to(() => page!);
          },
          child: CircularBorder(
            color: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .secondary,
            width: 1,
            size: 25,
            icon: Icon(
              Icons.add,
              size: 22,
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .primary,
            ),
          ),
        ),
      ]),
      const SizedBox(
        height: 10,
      ),
      Divider(
        height: 2,
        color:
            Provider.of<ThemeProvider>(context).themeData.colorScheme.secondary,
      ),
    ]);
  }
}
