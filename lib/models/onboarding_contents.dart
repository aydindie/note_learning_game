import 'package:easy_localization/easy_localization.dart';

import '../constants/strings.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "t".tr(),
    image: contentAsset,
    desc: "d".tr(),
  ),
  OnboardingContents(
    title: "t1".tr(),
    image: contentAsset1,
    desc: "d1".tr(),
  ),
  //onboarding about duraiton
  OnboardingContents(
    title: "t2".tr(),
    image: contentAsset2,
    desc: "d2".tr(),
  ),
  //onboarding about note  widget with play button
  OnboardingContents(
    title: "t3".tr(),
    image: contentAsset3,
    desc: "d3".tr(),
  ),
  //onboarding about note answer optons
  OnboardingContents(
    title: "t4".tr(),
    image: contentAsset4,
    desc: "d4".tr(),
  ),
  //onboaard  tum ayarları ayarlardan düzeltebilirsin
  OnboardingContents(
    title: "t5".tr(),
    image: contentAsset5,
    desc: "d5".tr(),
  ),

  // OnboardingContents(
  //   title: "Get notified when work happens",
  //   image: "assets/images/image3.png",
  //   desc:
  //       "Take control of notifications, collaborate live or on your own time.",
  // ),
];
