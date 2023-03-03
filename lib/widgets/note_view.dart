// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:note_learning_game/widgets/note_cards.dart';
import 'package:provider/provider.dart';

import '../stores/note_view_model.dart';


class NoteView extends StatelessWidget {
  const NoteView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NoteViewModel>(context);
    if (viewModel.contextt == null) {
      viewModel.setContext(context);
    }
    return Observer(builder: (_) {
      return InkWell(
        // onTap: () {
        //   viewModel.updateRandomIndex();
        // },
        child: Column(
          children: [
            viewModel.items.isNotEmpty
                ? Center(child: buildObserverCard(viewModel))
                : const CircularProgressIndicator(),
          ],
        ),
      );
    });
  }

  Widget buildObserverCard(NoteViewModel viewModel) {
    return NoteCard(
      noteModel: viewModel.items[viewModel.noteIndex],
    );
  }

  Observer buildObserverBody(NoteViewModel viewModel) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: viewModel.items.length,
        itemBuilder: (context, index) {
          return NoteCard(
            noteModel: viewModel.items[index],
          );
        },
      );
    });
  }
}
