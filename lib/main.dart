import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:note_learning_game/controller/language_controller.dart';
import 'package:note_learning_game/stores/sound_store.dart';
import 'package:note_learning_game/stores/theme_store.dart';
import 'package:note_learning_game/ui/Home/home_view.dart';
import 'package:note_learning_game/ui/Onboard/onboarding.dart';
import 'package:provider/provider.dart';
import "package:flutter/services.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'models/note_model.dart';
import 'stores/all_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardShown = prefs.getBool('onboardShown') ?? false;
  print('onboardShown $onboardShown');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await EasyLocalization.ensureInitialized();
  runApp(
    // DevicePreview(
    //   enabled: false,
    //   builder: (context) {
    //     return 
        EasyLocalization(
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('tr', 'TR'),
              Locale('de', 'DE'),
              Locale('fr', 'FR'),
            ],
            path:
                'assets/translations', // <-- change the path of the translation files
            fallbackLocale: const Locale('en', 'US'),
            child: MultiProvider(providers: [
              // Provider<LocaleStore>(
              //   create: (_) => LocaleStore(),
              ChangeNotifierProvider(create: (_) => LanguageController()),
              Provider<ThemeStore>(
                create: (_) => ThemeStore(),
              ),

              Provider<AllStore>(
                create: (_) => AllStore(),
              ),
              Provider<NoteModel>(
                create: (_) => NoteModel(),
              ),
              Provider(create: (_) => SoundStore()),
            ], child: MyApp(onboardShown: onboardShown)))
    //         ;
    //   },
    // ),
  );
}

//DIKEY OLSUN
class MyApp extends StatefulWidget {
  final bool onboardShown;
  const MyApp({super.key, required this.onboardShown});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: "Note Learning Game",
        useInheritedMediaQuery: true,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        //   builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        //TODO: burada tema değiştiğinde değişecek
        // locale: DevicePreview.locale(context),
        // theme: themeStore.themeData.copyWith(
        //   textTheme: themeStore.themeData.textTheme.apply(
        //     fontFamily: GoogleFonts.robotoSlab().fontFamily,
        //   ),
        // ),
        theme: ThemeData(
          textTheme: GoogleFonts.robotoSlabTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home:
            widget.onboardShown ? const MyHomePage() : const OnboardingScreen(),
        // routes: routeApp
      );
    });
  }
}
