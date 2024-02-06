class WorkModel {
  String title;
  String description;
  String? link;
  bool isAndroid;
  bool isIos;
  List<String> imgs;
  List<String> tags;

  WorkModel(
      {required this.title,
      required this.description,
      this.link,
      this.isAndroid = true,
      this.imgs = const [],
      this.tags = const [],
      this.isIos = true});
}


