// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobile/model/card/write_record_type_model.dart';
// import 'package:mobile/repository/repository.dart';
// import 'package:nfc_manager/nfc_manager.dart';

// class NdefWriteModel with ChangeNotifier {
//   NdefWriteModel(this._repo);

//   final Repository _repo;

//   Stream<Iterable<WriteRecord>> subscribe() {
//     return _repo.subscribeWriteRecordList();
//   }

//   Future<void> delete(WriteRecord record) {
//     return _repo.deleteWriteRecord(record);
//   }

//   Future<String?> handleTag(
//       NfcTag tag, Iterable<WriteRecord> recordList) async {
//     final tech = Ndef.from(tag);

//     if (tech == null) throw ('Tag is not ndef.');

//     if (!tech.isWritable) throw ('Tag is not ndef writable.');

//     try {
//       final message = NdefMessage(recordList.map((e) => e.record).toList());
//       await tech.write(message);
//     } on PlatformException catch (e) {
//       throw (e.message ?? 'Some error has occurred.');
//     }

//     return '[Ndef - Write] is completed.';
//   }
// }
