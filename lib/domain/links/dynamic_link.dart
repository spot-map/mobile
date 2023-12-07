import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:ride_map/presentation/common/router/routes.dart';
//
Future<Uri> createLink(String spotId) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://spotmap.page.link',
      link: Uri.parse('https://spotmap.page.link/spot/?id=$spotId'),
      androidParameters: const AndroidParameters(minimumVersion: 0, packageName: 'com.example.ride_map'),
      iosParameters: const IOSParameters(bundleId: 'com.example.ride_map', minimumVersion: '0'));

  return parameters.link;
}
//
//
// class DynamicLinkHandler {
//   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
//   Future<void> initDynamicLinks(BuildContext context) async {
//     dynamicLinks.onLink.listen((dynamicLinkData) {
//       // Listen and retrieve dynamic links here
//       final String deepLink = dynamicLinkData.link.toString(); // Get DEEP LINK
//       // Ex: https://namnp.page.link/product/013232
//       final String path = dynamicLinkData.link.path; // Get PATH
//       // Ex: product/013232
//       if(deepLink.isEmpty)  return;
//       handleDeepLink(path, context);
//     }).onError((error) {
//       print('onLink error');
//       print(error.message);
//     });
//     initUniLinks(context);
//   }
//   Future<void> initUniLinks(BuildContext context) async {
//     try {
//       final initialLink = await dynamicLinks.getInitialLink();
//       if(initialLink == null)  return;
//       handleDeepLink(initialLink.link.path, context);
//     } catch (e) {
//       // Error
//     }
//   }
//   void handleDeepLink(String path, BuildContext context) {
//     context.go(AppRoutes.addSpot);
//   }
// }
