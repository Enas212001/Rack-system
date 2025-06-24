import 'package:flutter/material.dart';

import 'add_user_button.dart';

class AddClientWidget extends StatelessWidget {
  const AddClientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Our Clients', style: Theme.of(context).textTheme.titleMedium),
        Spacer(),
        Row(children: [AddUserButton()]),
      ],
    );
  }
}
