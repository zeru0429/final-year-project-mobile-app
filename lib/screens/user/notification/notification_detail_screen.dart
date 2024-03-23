// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/widgets/buttons/appbar_button.dart';
import 'package:mobile/widgets/headers/app_header_section.dart';
import 'package:provider/provider.dart';

class NotificationDetaile extends StatefulWidget {
  const NotificationDetaile({super.key});

  @override
  State<NotificationDetaile> createState() => _NotificationDetaileState();
}

class _NotificationDetaileState extends State<NotificationDetaile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppHeaderSection(
              title: 'Detail',
              widget: AppBackButton(),
              messagingPage: false,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .background,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .colorScheme
                              .primary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1620163280053-68782bd98475?q=80&w=1365&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .colorScheme
                              .surface,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vaccination Date Coming',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Provider.of<ThemeProvider>(context)
                                      .themeData
                                      .colorScheme
                                      .secondary,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'You are scheduled to receive the polio vaccine at GBE Hospital on the upcoming Monday. This vaccine is extremely important for the health and well-being of your child, as it helps protect them from the poliovirus.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Provider.of<ThemeProvider>(context)
                                      .themeData
                                      .colorScheme
                                      .primary,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'You took the previous vaccine at GBE Hospital',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Provider.of<ThemeProvider>(context)
                                          .themeData
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                  Text(
                                    'Sep 23, 2024',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Provider.of<ThemeProvider>(context)
                                          .themeData
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
