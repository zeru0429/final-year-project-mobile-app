import 'package:flutter/material.dart';

import '../../providers/theme_provider.dart';
import 'package:provider/provider.dart';

// ignore: constant_identifier_names
enum ProfileAvatorType { Icon, Image, Button }

class ProfileAvator extends StatelessWidget {
  final ProfileAvatorType dummyType;
  final double scale;
  final String? image;
  final Color? color;
  final IconData? icon;
  ProfileAvator(
      {super.key,
      required this.dummyType,
      required this.scale,
      required this.color,
      this.icon,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40 * scale,
      height: 40 * scale,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: dummyType == ProfileAvatorType.Icon
            ? Icon(
                Icons.person,
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .secondary,
                size: 30 * scale,
              )
            : Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                  image!,
                ),
              ),
      ),
    );
  }
}
