// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class TraditionalCard extends StatefulWidget {
  const TraditionalCard({super.key});

  @override
  State<TraditionalCard> createState() => _TraditionalCardState();
}

class _TraditionalCardState extends State<TraditionalCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.01),
            color: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PersonDetail(
                ID: "89700",
                firstName: 'Aster',
                middleName: 'Aweke',
                lastName: 'Mamo',
                isMother: true,
                bloodType: "B+",
              ),
              //titile section
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                      child: isExpanded
                          ? Icon(
                              Icons.add,
                              size: 25,
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .secondary,
                            )
                          : Icon(
                              Icons.remove,
                              size: 25,
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .secondary,
                            ),
                    ),
                  ),
                  Text(
                    "Mother vaccine",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .primary,
                    ),
                  ),
                ],
              ),
              // mother vaccine table
              !isExpanded ? const MotherVaccineTable() : const SizedBox(),
              //childrens
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  "Childrens",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Provider.of<ThemeProvider>(context)
                        .themeData
                        .colorScheme
                        .primary,
                  ),
                ),
              ),
              //child rows
              const ChildVaccineInfo(),
              const ChildVaccineInfo()
            ],
          ),
        ),
      ),
    );
  }
}

class PersonDetail extends StatelessWidget {
  const PersonDetail(
      {super.key,
      required this.ID,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.bloodType,
      this.gender,
      this.birthDate,
      required this.isMother});
  final String firstName;
  final String middleName;
  final String lastName;
  final String ID;
  final String bloodType;
  final String? gender;
  final String? birthDate;
  final bool isMother;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            firstName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
            ),
          ),
          Text(
            middleName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
            ),
          ),
          Text(
            lastName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
            ),
          ),
          Text(
            ID,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class MotherVaccineTable extends StatelessWidget {
  const MotherVaccineTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Provider.of<ThemeProvider>(context)
            .themeData
            .colorScheme
            .onBackground,
        style: BorderStyle.solid,
        borderRadius: BorderRadius.circular(5),
        width: 2,
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
            Radius.circular(5),
          )),
          children: [
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                'VId',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                'VName',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                'Date',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                'Appointment',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                '1',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                'tt1',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                '22-04-2024',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                '22-05-2024',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                '2',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                'tt2',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                '22-05-2024',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                '30-05-2024',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                '3',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                'tt3',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                '30-05-2024',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
            TableCell(
                child: SizedBox(
              height: 30,
              child: Center(
                  child: Text(
                '11-07-2024',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              )),
            )),
          ],
        ),
      ],
    );
  }
}

class ChildVaccineInfo extends StatefulWidget {
  const ChildVaccineInfo({super.key});

  @override
  State<ChildVaccineInfo> createState() => _ChildVaccineInfoState();
}

class _ChildVaccineInfoState extends State<ChildVaccineInfo> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          const PersonDetail(
              ID: "2342",
              firstName: 'Mamush',
              middleName: 'Tezera',
              lastName: 'Kefyalewu',
              isMother: false,
              bloodType: "AB+",
              gender: "MALE",
              birthDate: '23-03-2024'),
          !isExpanded ? const MotherVaccineTable() : const SizedBox(),
        ],
      ),
    );
  }
}
