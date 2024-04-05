// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobile/providers/auth.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AccountOptions extends StatefulWidget {
  const AccountOptions({super.key});

  @override
  State<AccountOptions> createState() => _AccountOptionsState();
}

class _AccountOptionsState extends State<AccountOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleRow(
                  label: "USER ID",
                  data:
                      Provider.of<AuthProvider>(context).getUser.id.toString(),
                ),
                SingleRow(
                  label: "ROLE",
                  data: Provider.of<AuthProvider>(context)
                      .getUser
                      .role
                      .toString(),
                ),
                SingleRow(
                  label: "FUll NAME",
                  data:
                      "${Provider.of<AuthProvider>(context).getUser.userProfile.firstName}  ${Provider.of<AuthProvider>(context).getUser.userProfile.middleName}  ${Provider.of<AuthProvider>(context).getUser.userProfile.lastName}",
                ),
                SingleRow(
                  label: "Email",
                  data: Provider.of<AuthProvider>(context)
                      .getUser
                      .email
                      .toString(),
                ),
                SingleRow(
                  label: "Phone",
                  data: Provider.of<AuthProvider>(context)
                      .getUser
                      .phone
                      .toString(),
                ),
                SingleRow(
                  label: "HEALTH STATION",
                  data: Provider.of<AuthProvider>(context)
                      .getUser
                      .healthStation!
                      .name
                      .toString(),
                ),
                SingleRow(
                  label: "HEALTH STATION",
                  data:
                      "${Provider.of<AuthProvider>(context).getUser.healthStation!.city}, ${Provider.of<AuthProvider>(context).getUser.healthStation!.subcity},  ${Provider.of<AuthProvider>(context).getUser.healthStation!.kebele}",
                ),
                //role based information
                Provider.of<AuthProvider>(context).getUser.role == "MOTHER"
                    ? Column(
                        children: [
                          SingleRow(
                            label: "BirthDate",
                            data: Provider.of<AuthProvider>(context)
                                .getUser
                                .motherProfile!
                                .birthdate
                                .toString(),
                          ),
                          SingleRow(
                            label: "BLOOD TYPE",
                            data: Provider.of<AuthProvider>(context)
                                .getUser
                                .motherProfile!
                                .bloodType
                                .toString(),
                          ),
                          SingleRow(
                            label: "RH",
                            data: Provider.of<AuthProvider>(context)
                                .getUser
                                .motherProfile!
                                .RH
                                .toString(),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          SingleRow(
                            label: 'Title',
                            data: Provider.of<AuthProvider>(context)
                                .getUser
                                .proProfile!
                                .title,
                          ),
                          SingleRow(
                            label: 'Position',
                            data: Provider.of<AuthProvider>(context)
                                .getUser
                                .proProfile!
                                .position,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ));
  }
}

class SingleRow extends StatelessWidget {
  const SingleRow({super.key, required this.label, required this.data});

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .onSurface,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Text(
              data,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .onSurface
                    .withOpacity(0.6),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
