class WorkModel {
  String title;
  String description;
  String? link;
  bool isAndroid;
  bool isIos;

  WorkModel(
      {required this.title,
      required this.description,
      this.link,
      this.isAndroid = true,
      this.isIos = true});
}

List<WorkModel> workList = [
  WorkModel(
      title: 'Sahl App',
      description:
          ' As a Flutter Developer for Sahl, I contributed to Qatar\'s diverse E-Commerce app. From groceries to pets, Sahl offers a seamless shopping experience with a visually appealing interface. My role involved data optimization, secure payment gateways, and an intuitive UI. '),
  WorkModel(
      title: 'Martvers',
      description:
          'Mobile Application made with Flutter to be used by rider of Martvers delivery company involving API and Google Map API Integration.',
      isAndroid: true,
      isIos: true,
      link: ''),
  WorkModel(
      title: 'BitZapa',
      description:
          'Crypto exchange wallet application based in UK, made in flutter. Re-skined and improved user interface of the application and created build for iOS and android.'),
  WorkModel(
      title: 'Taggle',
      description:
          'Social Media Application based in Malaysia, Crafted Taggle\'s UI using Flutter, which enabled seamless social interactions. Users explore curated activities, connect with like-minded individuals, and embark on shared adventures.'),
  WorkModel(
      title: 'Kafou',
      description:
          'As a Flutter Developer at Kafou, I developed an app integrating Qatar Government\'s LMS. It enables students to earn/redeem points at partner stores via QR codes, fostering engagement and enriching education, amplifying my tech-driven education passion.')
];
