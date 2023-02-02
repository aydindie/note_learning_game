import 'package:flutter/material.dart';

import 'Note/viewmodel/note_view_model.dart';
import 'feature/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final NoteViewModel viewModel = NoteViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'aa',
        viewModel: viewModel,
      ),
    );
  }
}
