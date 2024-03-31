// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobile/model/card/read_record_type_model.dart';
import 'package:mobile/model/card/write_record_type_model.dart';
import 'package:mobile/screens/user/card/write/EditTextPage.dart';
import 'package:mobile/screens/user/card/write/NdefWriteModel.dart';
import 'package:mobile/screens/user/card/write/session.dart';
import 'package:mobile/util/extentions.dart';
import 'package:mobile/widgets/form/form_row_widget.dart';
import 'package:mobile/widgets/texteditor/edite_text_external.dart';
import 'package:mobile/widgets/texteditor/ndfs_record.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';

class WriteOnlyWidget extends StatelessWidget {
  static Widget withDependency() => ChangeNotifierProvider<NdefWriteModel>(
        create: (context) =>
            NdefWriteModel(Provider.of(context, listen: false)),
        child: const WriteOnlyWidget(),
      );
  const WriteOnlyWidget({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ndef - Write'),
      ),
      body: StreamBuilder<Iterable<WriteRecord>>(
        stream: Provider.of<NdefWriteModel>(context, listen: false).subscribe(),
        builder: (context, ss) => ListView(
          padding: const EdgeInsets.all(2),
          children: [
            FormSection(children: [
              FormRow(
                  title: const Text('Add Record'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) =>
                                  EditTextPage.withDependency(),
                            ))
                      }),
              FormRow(
                title: Text('Start Session',
                    style: TextStyle(
                      color: ss.data?.isNotEmpty != true
                          ? Theme.of(context).disabledColor
                          : Theme.of(context).colorScheme.primary,
                    )),
                onTap: ss.data?.isNotEmpty != true
                    ? null
                    : () => startSession(
                          context: context,
                          handleTag: (tag) => Provider.of<NdefWriteModel>(
                                  context,
                                  listen: false)
                              .handleTag(tag, ss.data!),
                        ),
              ),
            ]),
            if (ss.data?.isNotEmpty == true)
              FormSection(
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('RECORDS'),
                    Text(
                        '${ss.data!.map((e) => e.record.byteLength).reduce((a, b) => a + b)} bytes'),
                  ],
                ),
                children: List.generate(ss.data!.length, (i) {
                  final record = ss.data!.elementAt(i);
                  return _WriteRecordFormRow(i, record);
                }),
              ),
          ],
        ),
      ),
    );
  }
}

class _WriteRecordFormRow extends StatelessWidget {
  _WriteRecordFormRow(this.index, this.record);

  final int index;

  final WriteRecord record;

  @override
  Widget build(BuildContext context) {
    final info = NdefRecordInfo.fromNdef(record.record);
    final editPageBuilder = _editPageBuilders[info.record.runtimeType];
    return FormRow(
      title: Text('#$index ${info.title}'),
      subtitle: Text('${info.subtitle}'),
      trailing: Icon(Icons.more_vert),
      onTap: () async {
        final result = await showModalBottomSheet<String>(
          context: context,
          builder: (context) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  visualDensity: VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  title: Text(
                    '#$index ${info.title}',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14),
                  ),
                ),
                ListTile(
                  title: Text('View Details'),
                  onTap: () => Navigator.pop(context, 'view_details'),
                ),
                if (editPageBuilder != null)
                  ListTile(
                    title: Text('Edit'),
                    onTap: () => Navigator.pop(context, 'edit'),
                  ),
                ListTile(
                  title: Text('Delete'),
                  onTap: () => Navigator.pop(context, 'delete'),
                ),
              ],
            ),
          ),
        );
        switch (result) {
          case 'view_details':
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NdefRecordPage(index, record.record),
                ));
            break;
          case 'edit':
            assert(editPageBuilder != null);
            Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => editPageBuilder!(record),
                ));
            break;
          case 'delete':
            final result = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Delete Record?'),
                content: Text('#$index ${info.title}'),
                actions: [
                  TextButton(
                    child: Text('CANCEL'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: Text('DELETE'),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ],
              ),
            );
            if (result == true)
              Provider.of<NdefWriteModel>(context, listen: false)
                  .delete(record)
                  .catchError((e) => print('=== $e ==='));
            break;
          case null:
            break;
          default:
            throw ('unsupported result: $result');
        }
      },
    );
  }
}

final _editPageBuilders = Map<Type, Widget Function(WriteRecord)>.unmodifiable(
  <Type, Widget Function(WriteRecord)>{
    WellknownTextRecord: (record) => EditTextPage.withDependency(record),
    ExternalRecord: (record) => EditExternalPage.withDependency(record),
  },
);

class NdefRecordInfo {
  const NdefRecordInfo(
      {required this.record, required this.title, required this.subtitle});

  final Record record;

  final String title;

  final String subtitle;

  static NdefRecordInfo fromNdef(NdefRecord record) {
    final _record = Record.fromNdef(record);
    if (_record is WellknownTextRecord)
      return NdefRecordInfo(
        record: _record,
        title: 'Wellknown Text',
        subtitle: '(${_record.languageCode}) ${_record.text}',
      );
    if (_record is WellknownUriRecord)
      return NdefRecordInfo(
        record: _record,
        title: 'Wellknown Uri',
        subtitle: '${_record.uri}',
      );
    if (_record is MimeRecord)
      return NdefRecordInfo(
        record: _record,
        title: 'Mime',
        subtitle: '(${_record.type}) ${_record.dataString}',
      );
    if (_record is AbsoluteUriRecord)
      return NdefRecordInfo(
        record: _record,
        title: 'Absolute Uri',
        subtitle: '(${_record.uriType}) ${_record.payloadString}',
      );
    if (_record is ExternalRecord)
      return NdefRecordInfo(
        record: _record,
        title: 'External',
        subtitle: '(${_record.domainType}) ${_record.dataString}',
      );
    if (_record is UnsupportedRecord) {
      // more custom info from NdefRecord.
      if (record.typeNameFormat == NdefTypeNameFormat.empty)
        return NdefRecordInfo(
          record: _record,
          title: _typeNameFormatToString(_record.record.typeNameFormat),
          subtitle: '-',
        );
      return NdefRecordInfo(
        record: _record,
        title: _typeNameFormatToString(_record.record.typeNameFormat),
        subtitle:
            '(${_record.record.type.toHexString()}) ${_record.record.payload.toHexString()}',
      );
    }
    throw UnimplementedError();
  }
}

String _typeNameFormatToString(NdefTypeNameFormat format) {
  switch (format) {
    case NdefTypeNameFormat.empty:
      return 'Empty';
    case NdefTypeNameFormat.nfcWellknown:
      return 'NFC Wellknown';
    case NdefTypeNameFormat.media:
      return 'Media';
    case NdefTypeNameFormat.absoluteUri:
      return 'Absolute Uri';
    case NdefTypeNameFormat.nfcExternal:
      return 'NFC External';
    case NdefTypeNameFormat.unknown:
      return 'Unknown';
    case NdefTypeNameFormat.unchanged:
      return 'Unchanged';
  }
}
