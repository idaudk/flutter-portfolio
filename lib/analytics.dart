// // Singleton class to hold the Analytics for for Firebase
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_core/firebase_core.dart';

// class Analytics {
//   Analytics._();

//   // Generate an instance of the firebase analytics class
//   final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

//   // Create an instance of this class as a singleton
//   static final Analytics _instance = Analytics._();

//   // Initialise firebase for the app
//   static Future<void> init() async {
//     await Firebase.initializeApp(
//         options: const FirebaseOptions(
//             apiKey: 'AIzaSyBSDYNhwgvLOamuKSbC3bfTuSYENtr9k7g',
//             appId: '1:43587857035:web:1613c9ea0f0115faa3c28e',
//             messagingSenderId: '43587857035',
//             projectId: 'portfolio-f9733'));
//     getData().setAnalyticsCollectionEnabled(true);
//   }

//   //Get the FirebaseAnalystics object to do event logging
//   static FirebaseAnalytics getData() {
//     return _instance.analytics;
//   }
// }
