// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../constants/enums.dart';
import '../stores/all_store.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({
    Key? key,
  }) : super(key: key);

  final _crossAxisCount = 6;
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
          return InkWell(
              enableFeedback: false,
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
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    viewModel.defaultList[index],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ));
        })),
        staggeredTileBuilder: (int index) => StaggeredTile.count(
            index == (_itemCount - 1) ? _crossAxisCount : 2, 1),
      ),
    );
  }
}
