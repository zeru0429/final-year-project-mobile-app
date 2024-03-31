// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobile/localization/locals.dart';
import 'package:mobile/notification_controller.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/repository/repository.dart';
import 'package:mobile/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelGroupKey: "basic_channel_group",
      channelKey: "basic_channel",
      channelName: "Basic Notification",
      channelDescription: "Basic notifications channel",
    )
  ], channelGroups: [
    NotificationChannelGroup(
      channelGroupKey: "basic_channel_group",
      channelGroupName: "Basic Group",
    )
  ]);
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  WidgetsFlutterBinding.ensureInitialized();
  final repo = await Repository.createInstance();
  runApp(
    // Wrap your app with MultiProvider to provide multiple objects to the widget tree
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        Provider<Repository>.value(
          value: repo,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;
  @override
  void initState() {
    configureLocalization();
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    final Map<Permission, PermissionStatus> permissionStatuses = await [
      Permission.camera,
      Permission.location,
      Permission.contacts,
      Permission.notification
    ].request();

    // Process the permission statuses and handle accordingly
    permissionStatuses.forEach((permission, status) {
      if (status.isGranted) {
        // Permission is granted, take appropriate action
        switch (permission) {
          case Permission.camera:
            // Camera permission granted, enable camera functionality
            break;
          case Permission.location:
            // Location permission granted, access user's location
            break;
          case Permission.contacts:
            // Contacts permission granted, access user's contacts
            break;
          case Permission.notification:
            // Contacts permission granted, access user's contacts
            break;
        }
      } else if (status.isDenied) {
        // Permission is denied, show a message or disable related features
        switch (permission) {
          case Permission.camera:
            // Camera permission denied, inform the user or disable camera functionality
            break;
          case Permission.location:
            // Location permission denied, inform the user or disable location-based features
            break;
          case Permission.contacts:
            // Contacts permission denied, inform the user or disable contacts-related features
            break;
          case Permission.notification:
            // Contacts permission granted, access user's contacts
            break;
        }
      } else if (status.isPermanentlyDenied) {
        // Permission is permanently denied, show a dialog or redirect user to app settings
        // to enable the permission manually
        switch (permission) {
          case Permission.camera:
            // Camera permission permanently denied, show a dialog or redirect to app settings
            break;
          case Permission.location:
            // Location permission permanently denied, show a dialog or redirect to app settings
            break;
          case Permission.contacts:
            // Contacts permission permanently denied, show a dialog or redirect to app settings
            break;
          case Permission.notification:
            // Contacts permission granted, access user's contacts
            break;
        }
      }
    });
  }

  void configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: "en");
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }

  void onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
