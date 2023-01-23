part of 'layouts.dart';

class LoadingLayout extends StatelessWidget {
  const LoadingLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Material(
      child:  Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
