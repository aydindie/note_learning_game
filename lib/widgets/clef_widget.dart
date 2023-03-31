// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../stores/all_store.dart';

class ClefWidget extends StatefulWidget {
  final BuildContext? context;
  final bool isItTreble;
  const ClefWidget({
    Key? key,
    this.context,
    required this.isItTreble,
  }) : super(key: key);

  @override
  State<ClefWidget> createState() => _ClefWidgetState();
}

class _ClefWidgetState extends State<ClefWidget> {
  @override
  Widget build(BuildContext context) {
    final allStore = Provider.of<AllStore>(widget.context!);
    return Observer(builder: (_) {
      return Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: InkWell(
                  enableFeedback: false,
                  onTap: () => widget.isItTreble
                      ? allStore.changeTreble()
                      : allStore.changeBass(),
                  child: Image(
                    image: AssetImage(
                        'assets/images/${widget.isItTreble ? 'treble.png' : 'bass.png'}'),
                    color: Colors.white,
                  ),
                ),
              )),
          const SizedBox(height: 10),
          CircleAvatar(
            backgroundColor: (!allStore.isBassOn && !allStore.isTrebleOn)
                ? Colors.black
                : widget.isItTreble
                    ? allStore.isTrebleOn
                        ? Colors.black
                        : Colors.transparent
                    : allStore.isBassOn
                        ? Colors.black
                        : Colors.transparent,
            radius: 7,
          ),
        ],
      );
    });
  }
}
