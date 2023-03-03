import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'models/note/note_model.dart';
import 'ui/Note/view/home_view.dart';
import 'stores/note_view_model.dart';

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
