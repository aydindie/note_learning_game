// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static List<String> TEST_IDS = [
    //from process.env
    dotenv.env['TEST_BANNER']!, //TEST BANNER Banner
    dotenv.env['TEST_INTERSTITIAL']!, // TEST Geçiş reklamı interstitial
    dotenv.env['TEST_REWARDED']!, //TEST Ödüllü
  ];
  static List<String> RELEASE_AD_IDS = [
    dotenv.env['RELEASE_BANNER']!, // RELEASE BANNER
    dotenv.env['RELEASE_INTERSTITIAL']!, //RELEASE Geçiş reklamı interstitial
    dotenv.env['RELEASE_REWARDED']!, //RELEASE Ödüllü
  ];

  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return kDebugMode ? TEST_IDS[0] : RELEASE_AD_IDS[0];
    } else if (Platform.isIOS) {
      return dotenv.env['IOS_BANNER']!;
    } else {
      return null;
    }
  }

  static String? get interstitialUnitAdId {
    if (Platform.isAndroid) {
      return kDebugMode ? TEST_IDS[1] : RELEASE_AD_IDS[1];
    } else if (Platform.isIOS) {
      return dotenv.env['IOS_INTERSTITIAL']!;
    } else {
      return null;
    }
  }

  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return kDebugMode ? TEST_IDS[2] : RELEASE_AD_IDS[2];
    } else if (Platform.isIOS) {
      return dotenv.env['IOS_REWARDED']!;
    } else {
      return null;
    }
  }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad loaded.'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    onAdOpened: (ad) => debugPrint('Ad opened.'),
    onAdClosed: (ad) => debugPrint('Ad closed.'),
    //onApplicationExit: (ad) => print('Left application.'),
  );
}
