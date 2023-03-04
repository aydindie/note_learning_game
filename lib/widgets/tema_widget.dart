import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:note_learning_game/stores/theme_store.dart';
import 'package:provider/provider.dart';

class TemaWidget extends StatefulWidget {
  const TemaWidget({super.key});

  @override
  State<TemaWidget> createState() => _TemaWidgetState();
}

class _TemaWidgetState extends State<TemaWidget> {
  @override
  Widget build(BuildContext context) {
    final themeStore = Provider.of<ThemeStore>(context);
    return Observer(builder: (_) {
      return Center(
        child: Switch(
          value: themeStore.isDarkMode,
          onChanged: (value) {
            themeStore.toggleTheme();
          },
        ),
      );
    });
  }
}
