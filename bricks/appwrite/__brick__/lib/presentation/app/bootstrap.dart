import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrated_notifier/hydrated_notifier.dart';
import 'package:path_provider/path_provider.dart';

import 'package:{{name}}/presentation/app/app.dart';

typedef DeferInitCreate<T extends Widget> = Future<T> Function();

class Bootstrap extends StatelessWidget {
  const Bootstrap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) => DeferInit(
          create: () async {
            /// Initialize storage
            HydratedStateNotifier.storage = await HydratedStorage.build(
              storageDirectory: kIsWeb
                  ? HydratedStorage.webStorageDirectory
                  : await getTemporaryDirectory(),
            );

            // await HydratedStateNotifier.storage.clear();

            return const App();
          },
        ),
      ),
    );
  }
}

/// Defer first frame based on a background service
class DeferInit<T extends Widget> extends StatefulWidget {
  const DeferInit({
    Key? key,
    required this.create,
    this.emptyWidget = const SizedBox.shrink(),
  }) : super(key: key);

  final DeferInitCreate<T> create;
  final Widget emptyWidget;

  @override
  State<DeferInit<T>> createState() => _DeferInitState<T>();
}

class _DeferInitState<T extends Widget> extends State<DeferInit<T>> {
  late Future<T> _future;

  @override
  void initState() {
    super.initState();
    RendererBinding.instance!.deferFirstFrame();
    _future = widget.create().whenComplete(() {
      RendererBinding.instance!.allowFirstFrame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox.shrink();
        } else if (snapshot.hasError) {
          return ErrorWidget(snapshot.error!);
        } else {
          assert(snapshot.data != null, 'Failed to build application');
          return snapshot.data!;
        }
      },
    );
  }
}
