

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void launchMailClient(String email) async {
  try {
    await launchUrlString('mailto:$email');
  } catch (e) {
    await Clipboard.setData(ClipboardData(text: email));
  }
}

void launchNewTabClient(String url) async {
  await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: '_blank',
    );
}
