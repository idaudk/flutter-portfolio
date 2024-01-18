

import 'package:flutter/material.dart';
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

// Function to scroll to a specific SliverToBoxAdapter widget based on key
  void scrollToSection(GlobalKey key, BuildContext context) {
    Navigator.pop(context);
    Scrollable.ensureVisible(key.currentContext!,
        curve: Curves.fastOutSlowIn, duration: const Duration(seconds: 1));
  }

  // Function to scroll to a specific SliverToBoxAdapter widget based on key
  void scrollToSectionDesktop(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        curve: Curves.fastOutSlowIn, duration: const Duration(seconds: 1));
  }
