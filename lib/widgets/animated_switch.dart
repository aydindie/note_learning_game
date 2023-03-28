// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:provider/provider.dart';

// import '../stores/theme_store.dart';

// class AnimatedSwitch extends StatefulWidget {
//   const AnimatedSwitch({super.key});

//   @override
//   _AnimatedSwitchState createState() => _AnimatedSwitchState();
// }

// class _AnimatedSwitchState extends State<AnimatedSwitch> {
//   final animationDuration = const Duration(milliseconds: 500);

//   @override
//   Widget build(BuildContext context) {
//     final themeStore = Provider.of<ThemeStore>(context);

//     return Observer(builder: (_) {
//       return GestureDetector(
//         onTap: () {
//           themeStore.toggleTheme();

//           // if (context.locale == const Locale('en', 'US')) {
//           //   context.setLocale(const Locale('de', 'DE'));
//           // } else {
//           //   context.setLocale(const Locale('en', 'US'));
//           // }
//         },
//         child: AnimatedContainer(
//           height: 40,
//           width: 70,
//           duration: animationDuration,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: themeStore.isDarkMode
//                 ? const Color(0xff565671)
//                 : const Color(0xff989fd5),
//             border: Border.all(color: Colors.white, width: 2),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.shade400,
//                 spreadRadius: 2,
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           child: AnimatedAlign(
//             duration: animationDuration,
//             alignment: themeStore.isDarkMode
//                 ? Alignment.centerRight
//                 : Alignment.centerLeft,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 2),
//               child: AnimatedContainer(
//                   key: UniqueKey(),
//                   duration: animationDuration,
//                   width: 30,
//                   height: 30,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white,
//                   ),
//                   child: Image.network(themeStore.isDarkMode
//                       ? "https://cutewallpaper.org/24/moon-icon-png/moon-free-nature-icons.png"
//                       : "https://cdn-icons-png.flaticon.com/512/169/169367.png")),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
