import 'package:flutter/material.dart';

Future<dynamic> customShowDialog(
  BuildContext context, {
  required Widget widget,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      Future.delayed(const Duration(seconds: 2), () {
        // ignore: use_build_context_synchronously
        if (Navigator.canPop(context)) Navigator.pop(context);
      });
      return widget;
    },
  );
}
