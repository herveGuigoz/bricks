import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:{{name}}/application/login/login.dart';
import 'package:{{name}}/domain/authentication/authentication.dart';
import 'package:{{name}}/presentation/authentication/register/register_view.dart';
import 'package:{{name}}/presentation/components/unfocus.dart';

part 'login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  static const String path = '/login';

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
                    'Welcome back !',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const Gap(24),
                  const LoginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).go(RegisterView.path);
                        },
                        child: const Text('Sign up'),
                      ),
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
