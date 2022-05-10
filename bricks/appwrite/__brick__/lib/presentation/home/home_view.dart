import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/application/authentication/authentication.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  static const String path = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(authStateProvider.notifier).logOut();
          },
          child: const Text('LogOut'),
        ),
      ),
    );
  }
}
