import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/Note/model/note_model.dart';
import 'features/Note/viewmodel/note_view_model.dart';
import 'features/Note/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
        Provider<NoteViewModel>(
          create: (context) => NoteViewModel(),
        ),
        Provider<NoteModel>(
          create: (_) => NoteModel(),
        )
      ], child: const MaterialApp(home: MyHomePage()));
}
