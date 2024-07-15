// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:note_learning_game/stores/all_store.dart';
// import 'package:provider/provider.dart';

// import '../stores/timer_store.dart';

// class LinearStoreTimer extends StatefulWidget {
//   const LinearStoreTimer({Key? key}) : super(key: key);

//   @override
//   _LinearStoreTimerState createState() => _LinearStoreTimerState();
// }

// class _LinearStoreTimerState extends State<LinearStoreTimer> {
//   @override
//   Widget build(BuildContext context) {
//     return Observer(builder: (_) {
//       return Stack(
//         children: [
//           Container(
//             height: 30.0,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15.0),
//               color: Colors.black,
//             ),
//             child: FractionallySizedBox(
//               alignment: Alignment.centerLeft,
//               widthFactor: context.watch<AllStore>().barWidth,
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.0),
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               context.read<AllStore>().startTimer();
//             },
//             child: SizedBox(
//               height: 30,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         context.watch<AllStore>().kalanMs <= 0
//                             ? "finished"
//                             : ("${(context.watch<AllStore>().kalanMs / 1000).toStringAsFixed(0)}s left"),
//                         style: TextStyle(
//                           color: context.watch<AllStore>().kalanMs <= 0
//                               ? Colors.white
//                               : Colors.black,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                     const Icon(
//                       Icons.timer_sharp,
//                       color: Colors.white,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       );
//     });
//   }
// }
