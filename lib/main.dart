import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:note_learning_game/features/Settings/viewmodel/settings_store.dart';
import 'package:provider/provider.dart';

import 'features/Note/model/note_model.dart';
import 'features/Note/viewmodel/note_view_model.dart';
import 'features/Note/view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            Provider<NoteViewModel>(
              create: (context) => NoteViewModel(),
            ),
            Provider<NoteModel>(
              create: (_) => NoteModel(),
            )
          ],
          child: Observer(builder: (_) {
            return const MaterialApp(home: MyHomePage());
          }));
}
