import 'package:flutter/material.dart';

AnimatedSwitcher AppAnimationSwithcer({
  required Widget child,
  Duration? duration = const Duration(milliseconds: 600),
  required Widget Function(Widget child, Animation<double> animation)
      transitionBuilder,
}) {
  return AnimatedSwitcher(
    duration: duration!,
    transitionBuilder: transitionBuilder,
    child: child,
  );
}

// AnimatedSwitcher(
//   duration: Duration(milliseconds: 500),
//   transitionBuilder: (Widget child, Animation<double> animation) {
//     return FadeTransition(
//       opacity: animation,
//       child: child,
//     );
//   },
//   child: DashboardView(),
// )
