import 'package:core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/application/register/register.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/presentation/authentication/login/login_view.dart';

part 'register_form.dart';

class RegisterView extends ConsumerWidget {
  const RegisterView({
    Key? key,
  }) : super(key: key);

  static const String name = 'auth:register';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    ref.listen<RegisterState>(
      registerStateProvider,
      (_, state) {
        state.status.onError((error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('$error'),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
        });
      },
    );

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
                          GoRouter.of(context).goNamed(LoginView.name);
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
