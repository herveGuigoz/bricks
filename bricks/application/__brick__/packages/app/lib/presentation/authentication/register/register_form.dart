part of 'register_view.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  void submit() {
    if (_formKey.currentState!.validate()) {
      ref.watch(registerStateProvider.notifier).submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTermsAccepted = ref.watch(
      registerStateProvider.select((state) => state.terms.value),
    );

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
              ref.read(registerStateProvider.notifier).emailChanged(value);
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
              ref.read(registerStateProvider.notifier).passwordChanged(value);
            },
          ),
          const Gap(16),
          TermsAndService(accepted: isTermsAccepted),
          const Gap(8),
          ElevatedButton(
            onPressed: isTermsAccepted ? submit : null,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}

class TermsAndService extends ConsumerWidget {
  const TermsAndService({
    Key? key,
    required this.accepted,
  }) : super(key: key);

  final bool accepted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Checkbox(
          onChanged: (_) {
            ref.read(registerStateProvider.notifier).termsChanged();
          },
          value: accepted,
        ),
        Text.rich(
          TextSpan(
            text: 'I agree with the',
            style: theme.textTheme.bodySmall,
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () {},
                text: ' Terms of service ',
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              const TextSpan(
                text: '& privacy policy.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
