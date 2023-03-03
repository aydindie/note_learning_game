// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../ui/Note/view/home_view.dart';
import '../stores/note_view_model.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({
    Key? key,
  }) : super(key: key);

  final _crossAxisCount = 3;
  final _itemCount = 7;
  final _containerWRatio = 0.25;
  final _containerHRatio = 0.2;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final viewModel = Provider.of<NoteViewModel>(context);


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
        itemBuilder: (BuildContext context, int index) => Center(
          child: InkWell(
            enableFeedback: false,
            onTap: () {
              if (viewModel.noteIndex % 7 == index) {
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
                child: Observer(
                  builder: (context) => Text(
                    viewModel.defaultList[index],
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
        staggeredTileBuilder: (int index) => StaggeredTile.count(index == (_itemCount - 1) ? _crossAxisCount : 1, 1),
      ),
    );
  }
}
