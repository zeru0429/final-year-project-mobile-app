// ignore_for_file: depend_on_referenced_packages, must_be_immutable, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/widgets/buttons/appbar_button.dart';
import 'package:mobile/widgets/buttons/post_button_widget.dart';
import 'package:mobile/widgets/chat/message.dart';
import 'package:mobile/widgets/headers/app_header_section.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile/providers/theme_provider.dart';

class MessagingScreen extends StatefulWidget {
  final String userName;

  final String image;
  const MessagingScreen(
      {super.key, required this.userName, required this.image});

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> sentImage = [
      "https://media.istockphoto.com/id/1408512922/photo/group-of-happy-african-children-east-africa.jpg?s=1024x1024&w=is&k=20&c=Y-MobBZiv5Cf4CecwkQfx_7sFF0_5bLA_1N48GhUMRY=",
      "https://media.istockphoto.com/id/1472556485/photo/african-man-collecting-coffee-cherries-east-africa.jpg?s=1024x1024&w=is&k=20&c=53fl95OK6fdRIMUNXIK_RD-N0yjtyAZMC6pPw7pOYls=",
      "https://media.istockphoto.com/id/615899020/photo/african-mother-carrying-her-baby-on-back-east-africa.jpg?s=1024x1024&w=is&k=20&c=71uivPFHT2wafzIdEBme7C4MFu-M9wRNRYcndmVALwk="
    ];

    List<SentImage> imageCards = List.generate(
        sentImage.length, (index) => SentImage(image: sentImage[index]));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.99,
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: const BoxDecoration(),
            child: AppHeaderSection(
              title: 'aster aweke',
              widget: Row(
                children: [
                  const AppBackButton(),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.phone,
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .secondary,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 40,
                    height: 40,
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
                        Icons.more_vert,
                        color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.99,
            height: MediaQuery.of(context).size.height * 0.84,
            decoration: const BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const SenderMessage(message: "Doing well, thanks! 👋"),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MessengerDetails(
                        image:
                            'https://images.unsplash.com/photo-1709589865176-7c6ede164354?q=80&w=1492&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        userName: 'abebe',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                width: 250,
                                //height: 50,
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 15),
                                decoration: BoxDecoration(
                                  color: Provider.of<ThemeProvider>(context)
                                      .themeData
                                      .colorScheme
                                      .primary,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50)),
                                ),
                                child: Text(
                                  "Just one question 😂",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                  ),
                                )),
                            const SizedBox(
                              width: 10,
                              height: 10,
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                width: 250,
                                //height: 50,
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 15),
                                decoration: BoxDecoration(
                                  color: Provider.of<ThemeProvider>(context)
                                      .themeData
                                      .colorScheme
                                      .primary,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50)),
                                ),
                                child: Text(
                                    "Can you please send me your latest mockup? ",
                                    style:
                                        GoogleFonts.lato(color: Colors.white))),
                            const SizedBox(
                              width: 10,
                              height: 10,
                            ),
                            Container(
                              height: 120,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [...imageCards]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SenderMessage(message: "Sure, wait for a minute."),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.99,
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: const BoxDecoration(),
            child: const PostBottomWidget(
              label: "Write a message",
            ),
          ),
        ],
      ),
    );
  }
}

class DarkRadialBackground extends StatefulWidget {
  final String position;
  final Color color;

  DarkRadialBackground({required this.color, required this.position});

  @override
  State<DarkRadialBackground> createState() => _DarkRadialBackgroundState();
}

class _DarkRadialBackgroundState extends State<DarkRadialBackground> {
  var list = List.generate(
    3,
    (index) => Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [...list, this.widget.color],
        center: (widget.position == "bottomRight")
            ? const Alignment(1.0, 1.0)
            : const Alignment(-1.0, -1.0),
      ),
    )));
  }
}
