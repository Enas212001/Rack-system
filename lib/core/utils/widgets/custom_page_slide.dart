import 'package:flutter/material.dart';

class CustomPageRouteSlide extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  CustomPageRouteSlide({required this.direction, required this.child})
    : super(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => child,
      );
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: getDirectionOffset(),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  Offset getDirectionOffset() {
    switch (direction) {
      case AxisDirection.left:
        return const Offset(1, 0);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.up:
        return const Offset(0.5, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
    }
  }
}
