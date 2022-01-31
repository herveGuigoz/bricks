part of 'navigation.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Page Not Found',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onLongPress: () => TheRouter.of(context).go('/'),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 60, minWidth: 100),
              child: const Text('Go to home page'),
            ),
          ),
        ],
      ),
    );
  }
}
