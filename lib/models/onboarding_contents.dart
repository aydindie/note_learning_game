import 'package:easy_localization/easy_localization.dart';

import '../constants/strings.dart';

class OnboardingContents {
   String title;
   String image;
   String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "t",
    image: contentAsset,
    desc: "d",
  ),
  OnboardingContents(
    title: "t1",
    image: contentAsset1,
    desc: "d1",
  ),
  //onboarding about duraiton
  OnboardingContents(
    title: "t2",
    image: contentAsset2,
    desc: "d2",
  ),
  //onboarding about note  widget with play button
  OnboardingContents(
    title: "t3",
    image: contentAsset3,
    desc: "d3",
  ),
  //onboarding about note answer optons
  OnboardingContents(
    title: "t4",
    image: contentAsset4,
    desc: "d4",
  ),
  //onboaard  tum ayarları ayarlardan düzeltebilirsin
  OnboardingContents(
    title: "t5",
    image: contentAsset5,
    desc: "d5",
  ),

  // OnboardingContents(
  //   title: "Get notified when work happens",
  //   image: "assets/images/image3.png",
  //   desc:
  //       "Take control of notifications, collaborate live or on your own time.",
  // ),
];
