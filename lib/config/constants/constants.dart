import 'package:flutter/cupertino.dart';
import 'package:portfolio_daudk/config/resources/resources.dart';
import 'package:portfolio_daudk/data/models/experience_model.dart';
import 'package:portfolio_daudk/data/models/expertise_model.dart';
import 'package:portfolio_daudk/data/models/work_model.dart';

abstract class Constants {
  static const email = 'imdaudk@gmail.com';

  static const yourProjectgoes = 'YOUR PROJECT GOES HERE';
  static const yourProjectgoes2 = 'Let’s turn your idea into a visual reality';
  static const getInTouch = 'Get in Touch';
  static const letsWorkTogether = 'Lets work together!';
  static const areYouReady =
      'Are you ready to take your brand to new heights? Let\'s have a quick chat to discuss your needs and how I can best help your brand reach its full potential.';
  static const areYouReady2 =
      'Are you ready to take your brand to new heights? Let\'s have a quick chat to\ndiscuss your needs and how I can best help your brand reach its full potential.';

  static const githubLink = 'https://github.com/idaudk';
  static const linkedInLink = 'https://www.linkedin.com/in/idaudk/';
  static const dribbleLink = 'https://dribbble.com/daudk';
  static const spotifyLink =
      'https://open.spotify.com/playlist/4Dl4dlMI2LeSw21zKnr7E6?si=de85e30fe95d4c91';

  static const aboutText =
      'I\'m Daud khan, Versatile developer with 3 years of experience across various technologies. Expertise in creating cross-platform mobile applications with a focus on UI/UX design. Skilled in crafting user-friendly websites using Wix and WordPress, ensuring seamless navigation and engaging user experiences. Committed to delivering high-quality, scalable, and visually appealing digital solutions.';

  static const List<String> translations = [
    'Hello',
    'Bonjour',
    'Marhaba',
    'Salaam',
    'Hola',
    'Ciao',
    'Hallo',
    'Hej',
    'Ahoj',
    'Saluton',
    'Konnichiwa',
    'Annyeong',
    'Ni Hao',
    'Namaste',
  ];

  static final List<WorkModel> workList = [
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
          'https://i.ibb.co/mbjPPbS/189037257-9bd38bb9-cd7b-4032-96c4-f834c2058c26.jpg',
          'https://i.ibb.co/1JCdtV6/189038071-aab061d5-63c8-4006-afb6-00f51c0569cb.jpg',
          'https://i.ibb.co/8b4s7W3/189040773-4f52936d-28e4-4638-961b-723d01f6a124.jpg',
          'https://i.ibb.co/jHW9n5Z/189042219-cf2d7eb9-e73c-416f-bf79-2ceb53154e4b.jpg',
        ],
        link:
            'https://play.google.com/store/apps/details?id=com.cybersync.mertvers_rider_app'),
    WorkModel(
      title: 'We-Ryde',
      description:
          'We-Ryde is a car-pooling/ride sharing mobile application created using flutter utilyzing different 3rd party APIs like Firebase, Google Maps, MapBox, the main functionality invloves posting rides, requesting to join the ride, accepting or rejecting join request.',
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

  static final List<Expertise> expertiseList = [
    Expertise(
        title: 'Flutter Dev',
        subTitle: 'Android, iOS',
        description:
            'Skilled in developing hybrid mobile apps and cross-platform solutions using the Flutter framework.',
        icon: SvgAssets.flutter),
    Expertise(
        title: 'No Code Website Tools',
        subTitle: 'WordPress, Framer, Wix, Webflow',
        description:
            'Crafting seamless web experiences without writing a single line of code. Proficient in No Code tools like WordPress, Framer, Wix, and Webflow to bring your digital vision to life effortlessly.',
        icon: SvgAssets.code),
    Expertise(
        title: 'UI/UX Design',
        subTitle: 'User Interfaces, Figma',
        description:
            'Passionate about creating intuitive user interfaces and enhancing user experiences through thoughtful design principles. Continuously learning and applying UI/UX best practices to deliver engaging digital products.',
        icon: SvgAssets.layers),
  ];

  static final List<Experience> experienceList = [
    Experience(
        title: 'Flutter Developer @ Baladi Express',
        description:
            'As a Flutter Developer, I developed and maintained Flutter applications, emphasizing API integration, error handling, andcode reusability. My work led to improved client satisfaction and exceeded customer expectations. I collaborated with cross-functional teams, including designers and quality engineers, and proactively enhanced my product knowledge through self-guided learning and courses',
        date: 'Dec 2022 - Aug 2023',
        link: 'https://www.baladiexpress.com/about_baladi/get',
        linkName: 'www.baladiexpress.com',
        location: 'Peshawar'),
    Experience(
        title: 'Flutter Developer @ Cyber Sync Technologies',
        link: 'https://cybersynctech.com/',
        linkName: 'cybersynctech.com',
        description:
            'My primary responsibilities involved developing, maintaining, and maintaining assigned Flutter applications along with resolving any related design and implementation issues. Developed hybrid app using flutter, api integration, getx, error handling, client satisfaction, code re-usability, code review with lead, gathered requirements and presented them to stakeholders. Made product knowledge readily available to self and other stakeholders using various courses. Worked closely with quality engineers, designers, and the support team.',
        date: 'Aug 2022 - Nov 2022',
        location: 'Peshawar'),
    Experience(
        title: 'Web Designer @ TechKor',
        link: 'https://techkor.co/',
        linkName: 'techkor.co',
        tags: [
          'UI/UX',
          'requirements engineering',
        ],
        description:
            'As a Web Designer at TechKor, I was responsible for designing and developing visually appealing and user-friendly websites for clients using various CMS platforms such as WordPress, Framer, and Wix. With a strong focus on understanding client objectives and target audience needs, I ensured that each website met high standards of quality and functionality. Over the course of my tenure, I successfully delivered more than 100 websites, demonstrating a track record of consistent and successful project delivery.',
        date: 'Jan 2021 - Aug 2022',
        location: 'Peshawar'),
  ];
}
