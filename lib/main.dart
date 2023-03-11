import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:note_learning_game/stores/sound_store.dart';
import 'package:note_learning_game/stores/theme_store.dart';
import 'package:note_learning_game/ui/Home/home_view.dart';
import 'package:provider/provider.dart';
import "package:flutter/services.dart";
import 'models/note_model.dart';
import 'stores/all_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        child: const MyApp()),
  );
}

//DIKEY OLSUN
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              home: const MyHomePage(),
            );
          },
        ),
      ),
    );
  }
}
