import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardShown = prefs.getBool('onboardShown') ?? false;
  print('onboardShown $onboardShown');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await EasyLocalization.ensureInitialized();
  runApp(
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
        child: MyApp(onboardShown: onboardShown)),
  );
}

//DIKEY OLSUN
class MyApp extends StatelessWidget {
  final bool onboardShown;
  const MyApp({super.key, required this.onboardShown});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AllStore>(
          create: (_) => AllStore(),
        ),
        Provider<NoteModel>(
          create: (_) => NoteModel(),
        ),
        Provider(create: (_) => SoundStore()),

      ],
      child: Provider(
        create: (_) => ThemeStore(),
        child: Observer(
          builder: (context) {
            final themeStore = Provider.of<ThemeStore>(context);
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: themeStore.themeData,
              home:
                  onboardShown ? const MyHomePage() : const OnboardingScreen(),
              // routes: routeApp
            );
          },
        ),
      ),
    );
  }
}
// //   Map<String, WidgetBuilder> get routeApp {
// //     return {
// //       "/": (context) => const MyHomePage(),
// //       "/onBoarding": (context) => const OnboardingScreen(),
// //     };
// //   }
// // }