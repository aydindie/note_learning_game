import 'package:flutter/material.dart';

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
