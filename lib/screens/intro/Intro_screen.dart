// ignore: file_names
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:animated_introduction/animated_introduction.dart';
import 'package:mobile/screens/signin_screen.dart';
import 'package:mobile/style/text_style.dart';
import 'package:mobile/util/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    setIntroPage();
  }

  final List<SingleIntroScreen> pages = [
    SingleIntroScreen(
      centerBallRadius: 150,
      sideDotsBgColor: Colors.black,
      headerBgColor: Colors.green.shade300,
      title: 'Welcome to Infant immunization App !',
      description: 'You will follow you vaccination using this appp  ',
      textStyle: textName(),
      imageHeightMultiple: 10,
      key: UniqueKey(),
      slidePagePadding: const EdgeInsets.all(10),
      headerWidget: SizedBox(
        child: SvgPicture.asset(
          'assets/svg/mobile1.svg',
        ),
      ),
    ),
    SingleIntroScreen(
      centerBallRadius: 150,
      sideDotsBgColor: Colors.black,
      headerBgColor: Colors.green.shade300,
      title: 'Mothers vaccination',
      description:
          'Mothers use this app to follow there vccination floww app  ',
      textStyle: textName(),
      imageHeightMultiple: 10,
      key: UniqueKey(),
      mainCircleBgColor: Colors.blue,
      slidePagePadding: const EdgeInsets.all(10),
      headerWidget: SizedBox(
        child: SvgPicture.asset(
          'assets/svg/mobile2.svg',
        ),
      ),
    ),
    SingleIntroScreen(
      centerBallRadius: 150,
      sideDotsBgColor: Colors.black,
      headerBgColor: Colors.green.shade300,
      title: 'Childrens vaccination',
      description:
          'childrens use this app to follow there vccination floww app  ',
      textStyle: textName(),
      imageHeightMultiple: 10,
      key: UniqueKey(),
      mainCircleBgColor: Colors.blue,
      slidePagePadding: const EdgeInsets.all(10),
      headerWidget: SizedBox(
        child: SvgPicture.asset(
          'assets/svg/mobile3.svg',
        ),
      ),
    ),
    SingleIntroScreen(
      centerBallRadius: 150,
      sideDotsBgColor: Colors.black,
      headerBgColor: Colors.green.shade300,
      title: 'Remainder',
      description: 'remaind your vaccination appointment in this app  ',
      textStyle: textName(),
      imageHeightMultiple: 10,
      key: UniqueKey(),
      mainCircleBgColor: Colors.blue,
      slidePagePadding: const EdgeInsets.all(10),
      headerWidget: SizedBox(
        child: SvgPicture.asset(
          'assets/svg/mobile4.svg',
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIntroduction(
        slides: pages,
        doneText: 'Done',
        footerBgColor: Colors.green.shade600,
        activeDotColor: Colors.white,
        textColor: const Color.fromARGB(184, 0, 0, 0),
        inactiveDotColor: Colors.green.shade50,
        containerBg: Colors.green,
        indicatorType: IndicatorType.circle,
        footerPadding: const EdgeInsets.all(20),
        footerGradients: [
          Colors.green.shade700,
          Colors.green.shade100,
        ],
        isFullScreen: true,
        footerRadius: 20,
        onDone: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const SigninScreen(),
              ),
              (route) => false);
        },
      ),
    );
  }
}
