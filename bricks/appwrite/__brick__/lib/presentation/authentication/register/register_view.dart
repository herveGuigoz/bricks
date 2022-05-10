import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:{{name}}/application/register/register.dart';
import 'package:{{name}}/domain/authentication/authentication.dart';
import 'package:{{name}}/presentation/authentication/login/login_view.dart';
import 'package:{{name}}/presentation/components/unfocus.dart';

part 'register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({
    Key? key,
  }) : super(key: key);

  static const String path = '/register';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Unfocus(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let’s get started!',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const Gap(8),
                  const Text(
                    'By creating your account.',
                  ),
                  const Gap(24),
                  const RegisterForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Do you have an account ?',
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).go(LoginView.path);
                        },
                        child: const Text('Log in'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
