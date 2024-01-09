import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expertise {
  String title;
  String subTitle;
  String description;
  IconData icon;
  Expertise(
      {required this.title,
      required this.subTitle,
      required this.description,
      required this.icon});
}

List<Expertise> expertiseList = [
  Expertise(
      title: 'Flutter Dev',
      subTitle: 'Android, iOS',
      description:
          'Skilled in developing hybrid mobile apps and cross-platform solutions using the Flutter framework.',
      icon: CupertinoIcons.wand_stars_inverse),
  Expertise(
      title: 'No Code Website Tools',
      subTitle: 'WordPress, Framer, Webflow',
      description:
          'Skilled in developing hybrid mobile apps and cross-platform solutions using the Flutter framework.',
      icon: CupertinoIcons.wand_stars_inverse),
];
