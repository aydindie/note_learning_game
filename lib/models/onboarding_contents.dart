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
    title: "Notaların sesine ulaşmak için sesi aç",
    image: "assets/images/soundd.png",
    desc:
        "Ana ekrandan ve ayarlardan istediğiniz zaman açıp kapatabilirsin.Notayı tekrar dinlemek için notanın üzerine basabilirsin.",
  ),
  OnboardingContents(
    title: "Oynadıkça öğren ve skorunu arttır.",
    image: "assets/images/scores.png",
    desc: "Oyun türüne göre ayrı en iyi ve anlık skorunu izleyebilirsin.",
  ),
  //onboarding about duraiton
  OnboardingContents(
    title: "Süreli oyunlarda süreyi ayarla",
    image: "assets/images/duration.png",
    desc:
        "Süreli oyunlarda süreyi ayarlayabilir ve oyunu istediğin zaman durdurabilirsin.",
  ),
  //onboarding about note  widget with play button
  OnboardingContents(
    title: "Süreli oyunlarda oyunu başlat",
    image: "assets/images/question.png",
    desc:
        "Süreli oyunlarda oyunu başlatmak için yeşil oynatma işaretine bas. Notayı tekrar dinlemek için notanın üzerine basabilirsin.",
  ),
  //onboarding about note answer optons
  OnboardingContents(
    title: "Notayı bil ve cevapları seç",
    image: "assets/images/answers.png",
    desc:
        "Süreli oyunlarda cevapları seçmek için seçmek istediğin cevabın üzerine bas.",
  ),
  //onboaard  tum ayarları ayarlardan düzeltebilirsin
  OnboardingContents(
    title: "Her şeyi ayarla!",
    image: "assets/images/allws.png",
    desc:
        "Tüm ayarları ayarlardan düzeltebilirsin. Ayarlardan istediğin zaman çıkış yapabilirsin.",
  ),

  // OnboardingContents(
  //   title: "Get notified when work happens",
  //   image: "assets/images/image3.png",
  //   desc:
  //       "Take control of notifications, collaborate live or on your own time.",
  // ),
];
