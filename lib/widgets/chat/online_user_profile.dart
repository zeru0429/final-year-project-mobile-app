// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/widgets/avators/profile_avator_widget.dart';
import 'package:provider/provider.dart';

class OnlineUserProfile extends StatelessWidget {
  final String image;

  const OnlineUserProfile({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileAvator(
          dummyType: ProfileAvatorType.Image,
          scale: 1,
          image: image,
          color: Provider.of<ThemeProvider>(context)
              .themeData
              .colorScheme
              .secondary,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
            ),
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
