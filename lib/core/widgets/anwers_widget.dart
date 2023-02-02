// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../Note/viewmodel/note_view_model.dart';
import '../../feature/home/home_view.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({
    Key? key,
    required this.h,
    required this.w,
    required this.viewModel,
  }) : super(key: key);

  final double h;
  final double w;
  final NoteViewModel viewModel;
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
              //TODO: BURADA SORUDAN VERI ALIP BURADA KONTROL ETMEK GEREKİYOR
              if (viewModel.noteIndex % 7 == index) {
                print("noteIndex: ${viewModel.noteIndex} index: $index girdi");
                viewModel.scoreIncrement();
                viewModel.updateRandomIndex();
              }
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
                  anwerList[index],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
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
