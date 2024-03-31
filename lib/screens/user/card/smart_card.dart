// ignore_for_file: depend_on_referenced_packages, duplicate_import

import 'package:flutter/material.dart';
import 'package:mobile/screens/user/card/read_only.dart';
import 'package:mobile/screens/user/card/write_only.dart';

class CardReader extends StatefulWidget {
  const CardReader({super.key});

  @override
  State<CardReader> createState() => _CardReaderState();
}

class _CardReaderState extends State<CardReader> {
  late String _selectedOption = 'read';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text('Read'),
                  leading: Radio(
                    value: 'read',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Write'),
                  leading: Radio(
                    value: 'write',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          _selectedOption == 'read'
              ? ReadCardOnlyWidget.withDependency()
              : Expanded(
                  child: WriteOnlyWidget.withDependency(),
                ),
        ],
      ),
    );
  }
}
