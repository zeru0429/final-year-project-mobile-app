// ignore_for_file: depend_on_referenced_packages, duplicate_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/model/card/ndfs_info_model.dart';
import 'package:mobile/model/card/read_card_model.dart';
import 'package:mobile/providers/theme_provider.dart';
import 'package:mobile/util/nfc.dart';
import 'package:mobile/widgets/form/form_row_widget.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mobile/localization/locals.dart';
import 'package:provider/provider.dart';

class ReadCardOnlyWidget extends StatefulWidget {
  static Widget withDependency() => ChangeNotifierProvider<TagReadModel>(
        create: (context) => TagReadModel(),
        child: const ReadCardOnlyWidget(),
      );
  const ReadCardOnlyWidget({super.key});

  @override
  State<ReadCardOnlyWidget> createState() => _ReadCardOnlyWidgetState();
}

class _ReadCardOnlyWidgetState extends State<ReadCardOnlyWidget> {
  bool _sessionComplted = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _sessionComplted
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleData.cardPageMessage.getString(context),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .secondary,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: SvgPicture.asset(
                      'assets/svg/mobile6.svg',
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      startSession(
                        context: context,
                        handleTag:
                            Provider.of<TagReadModel>(context, listen: false)
                                .handleTag,
                      );

                      setState(() {
                        _sessionComplted = !_sessionComplted;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .colorScheme
                              .secondary,
                        ),
                      ),
                    ),
                    child: Text(
                      LocaleData.startSession.getString(context),
                      style: TextStyle(
                        color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Consumer<TagReadModel>(builder: (context, model, _) {
                final tag = model.tag;
                final additionalData = model.additionalData;
                if (tag != null && additionalData != null) {
                  return Column(
                    children: [
                      TagInfo(tag, additionalData),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _sessionComplted = !_sessionComplted;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .secondary,
                            ),
                          ),
                        ),
                        child: Text(
                          LocaleData.back.getString(context),
                          style: TextStyle(
                            color: Provider.of<ThemeProvider>(context)
                                .themeData
                                .colorScheme
                                .secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              }),
            ),
    );
  }
}

class TagInfo extends StatelessWidget {
  TagInfo(this.tag, this.additionalData);

  final NfcTag tag;

  final Map<String, dynamic> additionalData;

  @override
  Widget build(BuildContext context) {
    final ndefWidgets = <Widget>[];

    Object? tech;

    tech = Ndef.from(tag);
    if (tech is Ndef) {
      final cachedMessage = tech.cachedMessage;
      if (cachedMessage != null) {
        Iterable.generate(cachedMessage.records.length).forEach((i) {
          final record = cachedMessage.records[i];
          final info = NdefRecordInfo.fromNdef(record);
          ndefWidgets.add(
            FormRow(
              title: Text('#$i ${info.title}'),
              subtitle: Text(info.subtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => NdefRecordPage(i, record),
                //     )),
              },
            ),
          );
        });
      }
    }

    return Column(
      children: [
        if (ndefWidgets.isNotEmpty)
          FormSection(
            header: const Text('NDEF'),
            children: ndefWidgets,
          ),
      ],
    );
  }
}
