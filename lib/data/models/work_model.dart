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

List<WorkModel> workList = [
  WorkModel(
      title: 'Sahl App',
      link: 'https://apps.apple.com/us/app/sahl/id1541171602',
      tags: [
        'mobile app',
        'flutter',
        'e-commerce',
      ],
      description:
          ' As a Flutter Developer for Sahl, I contributed to Qatar\'s diverse E-Commerce app. From groceries to pets, Sahl offers a seamless shopping experience with a visually appealing interface. My role involved data optimization, secure payment gateways, and an intuitive UI. '),
  WorkModel(
      title: 'Martvers',
      description:
          'Mobile Application made with Flutter to be used by rider of Martvers delivery company involving API and Google Map API Integration.',
      isAndroid: true,
      isIos: true,
      tags: [
        'mobile app',
        'flutter',
        'google map SDK',
      ],
      imgs: [
        'https://i.ibb.co/jHW9n5Z/189042219-cf2d7eb9-e73c-416f-bf79-2ceb53154e4b.jpg',
        'https://i.ibb.co/8b4s7W3/189040773-4f52936d-28e4-4638-961b-723d01f6a124.jpg',
        'https://i.ibb.co/1JCdtV6/189038071-aab061d5-63c8-4006-afb6-00f51c0569cb.jpg',
        'https://i.ibb.co/mbjPPbS/189037257-9bd38bb9-cd7b-4032-96c4-f834c2058c26.jpg'
      ],
      link:
          'https://play.google.com/store/apps/details?id=com.cybersync.mertvers_rider_app'),
  WorkModel(
    title: 'We-Ryde',
    description:
        'We-Ryde is a car-pooling/ride sharing mobile application created using flutter utilyzing different 3rd party API like Firebase, Google Maps, MapBox, the main functionality invloves posted rides and joining the rides.',
    isAndroid: true,
    tags: ['mobile app', 'flutter', 'google map SDK', 'mapbox SDK'],
    isIos: true,
    imgs: [
      'https://i.ibb.co/89ccPZ9/189099757-57d61abc-9f99-4465-b591-9e1896118e16.jpg',
      'https://i.ibb.co/7KvgYG6/189100005-b2b2832e-08e7-415f-a772-f7ce7b450972.jpg',
      'https://i.ibb.co/qsP91mg/189105659-908ad61f-763f-4868-9744-b6fcee5d9fc0.jpg',
      'https://i.ibb.co/bXY1Mf4/189105886-31c0a561-c346-49be-a1f6-9e424838f2a9.jpg',
      'https://i.ibb.co/r0f6DJw/189102647-05a01f5d-a9c8-4f19-b333-bded2fd8d741.jpg',
      'https://i.ibb.co/YZvmBJb/189107944-46d3d32f-647a-47a9-9bfb-a3f0913da35e.jpg'
    ],
  ),
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
