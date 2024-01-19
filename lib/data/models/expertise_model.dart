import 'package:flutter/cupertino.dart';

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
      subTitle: 'WordPress, Framer, Wix, Webflow',
      description:
          'Crafting seamless web experiences without writing a single line of code. Proficient in No Code tools like WordPress, Framer, Wix, and Webflow to bring your digital vision to life effortlessly.',
      icon: CupertinoIcons.wand_stars_inverse),
];
