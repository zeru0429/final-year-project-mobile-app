import 'package:flutter/foundation.dart';
import 'package:nfc_manager/nfc_manager.dart';

class TagReadModel extends ChangeNotifier {
  NfcTag? tag;

  Map<String, dynamic>? additionalData;
  Future<String?> handleTag(NfcTag tag) async {
    this.tag = tag;

    additionalData = {};
    notifyListeners();
// print("*1*******************************************");
    // print(tag.toString());
    // print("*2******************************************");
    // Object? tech;
    // tech = Ndef.from(tag);
    // if (tech is Ndef) {
    //   final cachedMessage = tech.cachedMessage;
    //   if (cachedMessage != null) {
    //     print("*3*******************************************");
    //     print(cachedMessage);
    //     print("**4******************************************");
    //     Iterable.generate(cachedMessage.records.length).forEach((i) {
    //       print("**5***********************************$i******");
    //       final record = cachedMessage.records[i];
    //       final info = NdefRecordInfo.fromNdef(record);
    //       print(info.toString());
    //       print(info.title);
    //       print(info.title);
    //       print(info.subtitle);

    //       print("*6*******************************************");
    //     });
    //   } else {}
    // } else {
    //   print("not ndfs");
    // }
    // print("***7*****************************************");
    return '[Tag - Read] is completed.';
  }
}
