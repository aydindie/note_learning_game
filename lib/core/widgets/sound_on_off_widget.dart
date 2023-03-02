import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:note_learning_game/features/Note/viewmodel/note_view_model.dart';
import 'package:provider/provider.dart';

import '../../features/Settings/viewmodel/settings_store.dart';

class SoundOnOffWidget extends StatefulWidget {
  const SoundOnOffWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SoundOnOffWidget> createState() => _SoundOnOffWidgetState();
}

class _SoundOnOffWidgetState extends State<SoundOnOffWidget> {
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<NoteViewModel>(context);

    return Observer(builder: (_) {
      return Container(
        decoration: BoxDecoration(
          color: viewmodel.isSoundOn ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 11),
          child: InkWell(
            enableFeedback: false,
            onTap: () => viewmodel.changeSound(),
            child: viewmodel.isSoundOn
                ? const Icon(
                    Icons.volume_up,
                    size: 31,
                  )
                : const Icon(
                    Icons.volume_off,
                    size: 31,
                  ),
          ),
        ),
      );
    });
  }
}
