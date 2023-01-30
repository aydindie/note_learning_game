import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _bestScore = 0;
  final int _score = 0;
  // controller
  final CountDownController _countDownController = CountDownController();
  @override
  Widget build(BuildContext context) {
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

                //scoreBar(h, w, Colors.yellow, "Best: $_bestScore"),
                // const SizedBox(
                //   height: 10,
                // ),
                CountdownTimer(countDownController: _countDownController),
                const SizedBox(
                  height: 15,
                ),
                scoreBar(h, w, Colors.blueAccent.shade100, "Score: $_score"),
                const SizedBox(
                  height: 10,
                ),
                QuestionWidget(h: h, w: w),
                //numpad gridview

                AnswersWidget(h: h, w: w),
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

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({
    Key? key,
    required this.h,
    required this.w,
  }) : super(key: key);

  final double h;
  final double w;
  final _crossAxisCount = 3;
  final _itemCount = 7;
  final _containerWRatio = 0.25;
  final _containerHRatio = 0.2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * 0.4,
      child: StaggeredGridView.countBuilder(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: _crossAxisCount,
        itemCount: _itemCount,
        itemBuilder: (BuildContext context, int index) => Container(
            child: Center(
          child: InkWell(
            onTap: () {
              print("tapped $index");
            },
            child: Container(
              height: w * _containerHRatio,
              width: w * _containerWRatio,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  index == 6 ? "C" : "$index",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                //  Ink.image(
                //   fit: BoxFit.cover,
                //   image: const NetworkImage(
                //       'https://www.kindacode.com/wp-content/uploads/2022/07/bottle.jpeg'),
                // ),
              ),
            ),
          ),
        )),
        staggeredTileBuilder: (int index) => StaggeredTile.count(
            index == (_itemCount - 1) ? _crossAxisCount : 1, 1),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.h,
    required this.w,
  }) : super(key: key);

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: h * 0.18,
        width: w * 0.8,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
            child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            backgroundColor:
                MaterialStateProperty.all(Colors.green), // <-- Button color
          ),
          child: const Icon(Icons.play_arrow, size: 50),
        )
            //iconbutton play button in circle
            ));
  }
}

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({
    Key? key,
    required CountDownController countDownController,
  })  : _countDownController = countDownController,
        super(key: key);

  final CountDownController _countDownController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _countDownController.start();
      },
      child: CircularCountDownTimer(
        duration: 10,
        initialDuration: 0,
        controller: _countDownController,
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.width / 4,
        ringColor: Colors.black,
        ringGradient: null,
        fillColor: Colors.blueAccent[100]!,
        fillGradient: null,
        backgroundColor: Colors.transparent,
        backgroundGradient: null,
        strokeWidth: 5.0,
        strokeCap: StrokeCap.round,
        textStyle: const TextStyle(
            fontSize: 33.0, color: Colors.black, fontWeight: FontWeight.bold),
        textFormat: CountdownTextFormat.S,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: false,
        onStart: () {
          debugPrint('Countdown Started');
        },
        onComplete: () {
          debugPrint('Countdown Ended');
        },
        onChange: (String timeStamp) {
          debugPrint('Countdown Changed $timeStamp');
        },
        timeFormatterFunction: (defaultFormatterFunction, duration) {
          if (duration.inSeconds == 10) {
            return "Start";
          } else {
            return Function.apply(defaultFormatterFunction, [duration]);
          }
        },
      ),
    );
  }
}

class TopIconButtons extends StatelessWidget {
  const TopIconButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.volume_up_outlined,
              size: 31,
            )),
        Row(
          children: [
            //info and settings iconbutton
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.info_outline,
                  size: 31,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings_outlined,
                  size: 31,
                )),
          ],
        )
      ],
    );
  }
}
