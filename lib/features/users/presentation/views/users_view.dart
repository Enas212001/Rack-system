import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/my_app_drawer.dart';

import 'widgets/user_view_body.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: MyAppDrawer(), body: UserViewBody());
  }
}
