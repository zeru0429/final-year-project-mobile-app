import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/widgets/dialog/nfc_dialogs.dart';
import 'package:nfc_manager/nfc_manager.dart';

Future<void> startSession({
  required BuildContext context,
  required Future<String?> Function(NfcTag) handleTag,
  String alertMessage = 'Hold your device near the item.',
}) async {
  if (!(await NfcManager.instance.isAvailable())) {
    return showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => const UnavailableDialog(),
    );
  }

  if (Platform.isAndroid) {
    return showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => AndroidSessionDialog(alertMessage, handleTag),
    );
  }

  if (Platform.isIOS) {
    return NfcManager.instance.startSession(
      alertMessage: alertMessage,
      onDiscovered: (tag) async {
        try {
          final result = await handleTag(tag);
          if (result == null) return;
          await NfcManager.instance.stopSession(alertMessage: result);
        } catch (e) {
          await NfcManager.instance.stopSession(errorMessage: '$e');
        }
      },
    );
  }

  throw ('unsupported platform: ${Platform.operatingSystem}');
}
