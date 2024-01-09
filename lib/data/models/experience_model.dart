class Experience {
  String title;
  String description;
  String date;
  String location;
  List<String> tags;
  String link;

  Experience(
      {required this.title,
      required this.description,
      required this.date,
      this.link = 'sample.com',
      required this.location,
      this.tags = const [
        'flutter',
      ]});
}

List<Experience> experienceList = [
  Experience(
      title: 'Flutter Developer @ Baladi Express',
      description:
          'As a Flutter Developer, I developed and maintained Flutter applications, emphasizing API integration, error handling, andcode reusability. My work led to improved client satisfaction and exceeded customer expectations. I collaborated with cross-functional teams, including designers and quality engineers, and proactively enhanced my product knowledge through self-guided learning and courses',
      date: 'Dec 2022 - Aug 2023',
      location: 'Peshawar'),
  Experience(
      title: 'Flutter Developer @ Cyber Sync Technologies',
      description:
          'My primary responsibilities involved developing, maintaining, and maintaining assigned Flutter applications along with resolving any related design and implementation issues. Developed hybrid app using flutter, api integration, getx, error handling, client satisfaction, code re-usability, code review with lead, gathered requirements and presented them to stakeholders. Made product knowledge readily available to self and other stakeholders using various courses. Worked closely with quality engineers, designers, and the support team.',
      date: 'Aug 2022 - Nov 2022',
      location: 'Peshawar'),
  Experience(
      title: 'Wordpress Developer @ TechKor',
      description:
          'Worked as a website designer and developed Wordpress website within given time frame and did requirement analysis to customized wordpress websites to fullfill the requirements. ',
      date: 'Jan 2021 - Aug 2022',
      location: 'Peshawar'),
];
