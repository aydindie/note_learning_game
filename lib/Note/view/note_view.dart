// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:note_learning_game/Note/viewmodel/note_view_model.dart';
import 'package:note_learning_game/core/widgets/note_cards.dart';

class NoteView extends StatelessWidget {
  final NoteViewModel viewModel;

  NoteView({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (viewModel.contextt == null) {
      viewModel.setContext(context);
    }
    return Container(
      child: Observer(builder: (_) {
        print("Observergirdi");

        return InkWell(
          onTap: () {
            viewModel.updateRandomIndex();
          },
          child: Column(
            children: [
              viewModel.items.isNotEmpty
                  ? Center(child: buildObserverCard())
                  : const CircularProgressIndicator(),
            ],
          ),
        );
      }),
    );
  }

  Widget buildObserverCard() {
    print("buildObserverCardgirdi");

    return NoteCard(
      noteModel: viewModel.items[viewModel.noteIndex],
      viewModel: viewModel,
    );
  }

  Observer buildObserverBody() {
    print("buildObserverBodygirdi");

    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: viewModel.items.length,
        itemBuilder: (context, index) {
          return NoteCard(
            noteModel: viewModel.items[index],
            viewModel: viewModel,
          );
        },
      );
    });
  }
}
