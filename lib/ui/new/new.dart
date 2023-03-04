// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:note_learning_game/ui/Settings/settings.dart';
import 'package:provider/provider.dart';

import '../../stores/theme_store.dart';
import '../../widgets/tema_widget.dart';

class NewScreen extends StatefulWidget {
  //final ThemeStore themeStore;
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    final themeStore = Provider.of<ThemeStore>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter MobX Theme Example'),
        ),
        body: Column(
          children: [
            const TemaWidget(),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsView(),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
