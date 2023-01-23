import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TextEditingController useTextController({
  String? Function()? create,
  required void Function(String input)? onChange,
}) {
  final controller = useTextEditingController(text: create?.call());

  void listener() => onChange?.call(controller.text);

  useEffect(() {
    controller.addListener(listener);
    return () => controller.removeListener(listener);
  });

  return controller;
}
