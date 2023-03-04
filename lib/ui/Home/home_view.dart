// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../stores/all_store.dart';
import '../../stores/theme_store.dart';
import '../../widgets/anwers_widget.dart';
import '../../widgets/countdown_timer.dart';
import '../../widgets/question_widget.dart';
import '../../widgets/top_iconbuttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // controller
  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<AllStore>(context);
    final themeStore = Provider.of<ThemeStore>(context);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Center(
            child: Column(
              children: [
                const TopIconButtons(),
                const SizedBox(
                  height: 10,
                ),
                Observer(builder: (_) {
                  return const CountdownTimer();
                }),
                Observer(
                  builder: (_) {
                    return scoreBar(h, w, Colors.blueAccent.shade100,
                        "Score: ${noteViewModel.score}");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                QuestionWidget(
                  viewModel: noteViewModel,
                ),

                //numpad gridview

                const AnswersWidget(),
                const SizedBox(
                  height: 50,
                ),
                Observer(builder: (_) {
                  return Center(
                    child: Switch(
                      value: themeStore.isDarkMode,
                      onChanged: (value) {
                        themeStore.toggleTheme();
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container scoreBar(double h, double w, Color color, String text) {
    return Container(
      alignment: Alignment.center,
      height: h * 0.04,
      width: w * 0.3,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}




//  Ink.image(
//   fit: BoxFit.cover,
//   image: const NetworkImage(
//       'https://www.kindacode.com/wp-content/uploads/2022/07/bottle.jpeg'),
// ),