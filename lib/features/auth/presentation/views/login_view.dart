import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';

import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.imagesRackBack, fit: BoxFit.cover),
            ),
            LoginViewBody(),
          ],
        ),
      ),
    );
  }
}
