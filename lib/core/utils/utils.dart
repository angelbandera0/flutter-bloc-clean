import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../global/app_globals.dart';
import 'index.dart';

class Utils {
  void showException({required String? message}) {
    assert(message != null);
    // add new notification
  }


  Future<void> launchInBrowser(String url) async {
    try {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } catch (_) {
      showException(message: 'URL inválida');
    }
  }
}
