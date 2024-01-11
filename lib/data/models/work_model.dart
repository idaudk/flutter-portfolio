class WorkModel {
  String title;
  String description;
  String? link;
  bool isAndroid;
  bool isIos;
  List<String> imgs;

  WorkModel(
      {required this.title,
      required this.description,
      this.link,
      this.isAndroid = true,
      this.imgs = const [],
      this.isIos = true});
}

List<WorkModel> workList = [
  WorkModel(
      title: 'Sahl App',
      link: 'https://apps.apple.com/us/app/sahl/id1541171602',
      description:
          ' As a Flutter Developer for Sahl, I contributed to Qatar\'s diverse E-Commerce app. From groceries to pets, Sahl offers a seamless shopping experience with a visually appealing interface. My role involved data optimization, secure payment gateways, and an intuitive UI. '),
  WorkModel(
      title: 'Martvers',
      description:
          'Mobile Application made with Flutter to be used by rider of Martvers delivery company involving API and Google Map API Integration.',
      isAndroid: true,
      isIos: true,
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
        'Mobile Application made with Flutter to be used by rider of Martvers delivery company involving API and Google Map API Integration.',
    isAndroid: true,
    isIos: true,
    imgs: [
      'https://uc2689d932d2ee93579a95f55266.dl.dropboxusercontent.com/cd/0/inline/CLJfPGNI3yWhNZ-88dB3xUAPp22ezAJz5STO69CEle2KdNoEmwAGD9Jt0xWD70EslF6Gu3PrUKJgRhjfzkt2dOBB0CRxxSCLQPeofYTZ_hJb-H5xDREe3VuDQzziVi9emrA36hjYZ9bSlBbZ09GoTmjC/file#',
      'https://ucde05838bf5302108e83467a5f3.dl.dropboxusercontent.com/cd/0/inline/CLJ0GsLKiurQH6ju2e2mv9KViGXWNoj57IPvEN9j_RHNOy51y-hzciUK0weYXPu47BOdh57C7pV-H2auHP2r-pJnT48zk7Wm0HD33_K8lo-ueC6R_vXyihii6G2Eg3swNErH2HAYDGXVgYSo3hjgtMGk/file#',
      'https://uc15fc87b8a0da6ff07e8d34d41e.dl.dropboxusercontent.com/cd/0/inline/CLLLYhH7GJcet2L4neTyY0TSTBj9QKpr903bZCmHEU422in0MktYLq5WOTO4fderDnynOEIgFDShFiGJyeVGKglc4M7OPd5MGbaJsGClRkus7GG-I0TV6LSw8pva-9goaBcgoi0Qvn9TukuFSwwEnRsb/file#',
      'https://uc44e10dd5fba1162dc3687ff93e.dl.dropboxusercontent.com/cd/0/inline/CLLASL9D9b582wYyUrSIt1QrVbrf_OgXFvbQdUa8tqq14BwmKmk1i45ZDGT9QG7rQ9DGdMTCQRd9bYUkxbVRA53ZB1EQPwjAgkAHXipQoOp7by8Y32GAf-XroV8l-d18Sp8Jm1Ig_3ljLC8K97E0B9WC/file#',
      'https://uc958185dde733e3933f89f0934e.dl.dropboxusercontent.com/cd/0/inline/CLIv7RoZ7-yREsQQJFms0T5gJnQVgyfp38-1DGKmUE2A_u6enQyYzYC5X1kgnpMD1sOusp_apSLqdC7OAQ1JGfup40kOh8UhitDnl92hLz_5xkZj72jdmetBgh_9RMfALJwv5D_oiyxAsjNPueA-nXYo/file#'
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
