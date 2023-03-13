// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../constants/enums.dart';
import '../stores/all_store.dart';
import '../utils/colors.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({
    Key? key,
  }) : super(key: key);

  final _crossAxisCount = 36;
  final _itemCount = 7;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final viewModel = Provider.of<AllStore>(context);

    return SizedBox(
      child: StaggeredGridView.countBuilder(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: _crossAxisCount,
        itemCount: _itemCount,
        itemBuilder: (BuildContext context, int index) =>
            Center(child: Observer(builder: (_) {
          return AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              color: (viewModel.noteIndex % 7 == index)
                  ? correctAnswerBackgroundColor
                  : wrongAnswerBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: TouchableOpacity(
                //enableFeedback: false,
                activeOpacity: 0.1,
                onTap: () {
                  if (viewModel.noteIndex % 7 == index) {
                    if (viewModel.durationPreferences ==
                        DurationPreferences.NONE) {
                      viewModel.changeScore();
                      viewModel.updateRandomIndex();
                    } else if (viewModel.durationPreferences ==
                        DurationPreferences.TWENTY) {
                      viewModel.changeScore20s();
                      viewModel.updateRandomIndex();
                    } else if (viewModel.durationPreferences ==
                        DurationPreferences.MINUTE) {
                      viewModel.changeScore1m();
                      viewModel.updateRandomIndex();
                    } else if (viewModel.durationPreferences ==
                        DurationPreferences.FIVE_MIN) {
                      viewModel.changeScore5m();
                      viewModel.updateRandomIndex();
                    }
                    //TODO: DİĞERLERİNİ EKLE
                  }
                },
                child: Container(
                  width: w / 3.2,
                  decoration: BoxDecoration(
                    color: answerBackgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Center(
                    child: Text(
                      viewModel.defaultList[index],
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: answersTextColor),
                    ),
                  ),
                )),
          );
        })),
        staggeredTileBuilder: (int index) => StaggeredTile.count(
            index == (_itemCount - 1) ? _crossAxisCount : 12, 7),
      ),
    );
  }
}
