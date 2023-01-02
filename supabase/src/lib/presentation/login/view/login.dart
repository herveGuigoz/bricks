import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase/presentation/login/bloc/presenter.dart';
import 'package:supabase/presentation/shared/components/unfocus.dart';
import 'package:supabase/presentation/shared/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    ref.listen<LoginState>(loginStatePresenter, (_, state) {
      state.status.mapOrNull(
        submissionInProgress: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        submissionSucceed: (_) => SuccessModal.show(context),
      );
    });

    return Unfocus(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: const Text('Sign in'),
            ),
            SliverPadding(
              padding: EdgeInsets.all(theme.spacing.regular),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const EmailInput(),
                  Gap(theme.spacing.big),
                  const SendEmailButton(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailInput extends ConsumerWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final isInProgress = ref.watch(
      loginStatePresenter.select((value) => value.status.isInProgress),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email adress',
          style: theme.textTheme.bodyLarge,
        ),
        Gap(theme.spacing.small),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          readOnly: isInProgress,
          onChanged: (email) {
            ref.read(loginStatePresenter.notifier).setEmail(email);
          },
          decoration: const InputDecoration(hintText: 'Email'),
        ),
      ],
    );
  }
}

class SendEmailButton extends ConsumerWidget {
  const SendEmailButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginStatePresenter);

    final isFormValid = state.status.maybeWhen(
      initial: () => state.isValid && !state.isPure,
      orElse: () => false,
    );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
      ),
      onPressed: isFormValid ? () => ref.read(loginStatePresenter.notifier).submit() : null,
      child: Text(
        state.status.maybeWhen(
          submissionInProgress: () => 'Loading',
          submissionSucceed: () => 'Magic link send',
          orElse: () => 'Send Magic Link',
        ),
      ),
    );
  }
}

class SuccessModal extends ConsumerWidget {
  const SuccessModal({super.key});

  static Future<void> show(BuildContext context) async {
    return showDialog(context: context, builder: (_) => const SuccessModal());
  }

  Future<void> launchEmailApp() async {
    if (Platform.isAndroid) {
      const intent = AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: 'android.intent.category.APP_EMAIL',
      );
      await intent.launch();
    } else if (Platform.isIOS) {
      await launchUrl(Uri.parse('message://'));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Magic link send'),
      actions: [
        TextButton(
          onPressed: () => launchEmailApp().then(
            (_) => Navigator.of(context).pop(),
          ),
          child: const Text('Open Email App'),
        ),
      ],
    );
  }
}
