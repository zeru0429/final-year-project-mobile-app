// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mobile/localization/locals.dart';
import 'package:mobile/widgets/appbar/app_bar.dart';
import 'package:mobile/widgets/avators/profile_avator_widget.dart';
import 'package:mobile/widgets/buttons/outlined_button_with_text.dart';
import 'package:mobile/widgets/profile_option.dart';
import '../../../providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late FlutterLocalization _flutterLocalization;

  late String _currentLocale;
  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        currentLocale: _currentLocale,
        onLocaleChanged: _setLocale,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: ProfileAvator(
                  dummyType: ProfileAvatorType.Image,
                  scale: 4,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondaryContainer,
                  image:
                      'https://media.istockphoto.com/id/1494343415/photo/woman-from-borana-tribe-holding-her-baby-ethiopia-africa.jpg?s=1024x1024&w=is&k=20&c=rS8uvA03J75RXNoCXKaj-GHPLb8y6JkDL1iM9jUCQcI=',
                  icon: Icons.person,
                  key: UniqueKey(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileTextOption(
                label: LocaleData.myAccount.getString(context),
                icon: Icons.person,
              ),
              ProfileTextOption(
                label: LocaleData.myChildren.getString(context),
                icon: Icons.child_care,
              ),
              ProfileTextOption(
                label: LocaleData.myCertification.getString(context),
                icon: Icons.list_alt_outlined,
              ),
              ProfileTextOption(
                label: LocaleData.privacySecurity.getString(context),
                icon: Icons.settings,
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButtonWithText(
                content: LocaleData.logout
                    .getString(context), // Remove getString(context)
                width: 230,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _setLocale(String? value) {
    if (value == null) return;
    if (value == "en") {
      _flutterLocalization.translate("en");
    } else if (value == "am") {
      _flutterLocalization.translate("am");
    } else if (value == "or") {
      _flutterLocalization.translate("or");
    } else {
      return;
    }
    setState(() {
      _currentLocale = value;
    });
  }
}
