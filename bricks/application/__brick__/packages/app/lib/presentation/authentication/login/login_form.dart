part of 'login_view.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email address',
            ),
            validator: EmailValidator(),
            onChanged: (value) {
              ref.read(loginStateProvider.notifier).emailChanged(value);
            },
          ),
          const Gap(16),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: PasswordValidator(),
            onChanged: (value) {
              ref.read(loginStateProvider.notifier).passwordChanged(value);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: theme.textTheme.bodyMedium,
            ),
            onPressed: () {},
            child: const Text('Forgot password'),
          ),
          const Gap(24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ref.read(loginStateProvider.notifier).submit();
              }
            },
            child: const Text('Log in'),
          ),
        ],
      ),
    );
  }
}
