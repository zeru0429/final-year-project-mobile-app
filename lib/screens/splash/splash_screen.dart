// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/providers/auth.dart';
import 'package:mobile/screens/intro/Intro_screen.dart';
import 'package:mobile/screens/signin_screen.dart';
import 'package:mobile/util/shared_preferences.dart';
import 'package:mobile/widgets/circular_progress_indicator.dart';

import '../../providers/theme_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//to check if the app is lauched befor
bool isItFirstTiles = true;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkIfFirstTiles();

    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                isItFirstTiles ? const IntroScreen() : const SigninScreen(),
          ),
        );
      },
    );
  }

  void checkIfFirstTiles() async {
    isItFirstTiles = await isForTheFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context)
            .themeData
            .colorScheme
            .background,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Well come",
              style: TextStyle(
                fontSize: 33,
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .secondary,
              ),
            ),
            SvgPicture.asset(
              'assets/svg/mobile2.svg',
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width * 0.70,
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: AnimatedCircularProgressIndicatorWidget(),
            )
          ],
        ),
      ),
    );
  }
}
