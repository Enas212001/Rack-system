import 'package:flutter/material.dart';

class AddFormWidget extends StatelessWidget {
  const AddFormWidget({super.key, this.childWidget});
  final Widget? childWidget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(16),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(padding: const EdgeInsets.all(24.0), child: childWidget),
      ),
    );
  }
}
