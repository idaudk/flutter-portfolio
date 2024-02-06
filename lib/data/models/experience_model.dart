class Experience {
  String title;
  String description;
  String date;
  String location;
  List<String> tags;
  String link;
  String linkName;

  Experience(
      {required this.title,
      required this.description,
      required this.date,
      this.link = 'sample.com',
      required this.location,
      this.linkName = 'Webpage',
      this.tags = const ['flutter', 'software engineering']});
}


