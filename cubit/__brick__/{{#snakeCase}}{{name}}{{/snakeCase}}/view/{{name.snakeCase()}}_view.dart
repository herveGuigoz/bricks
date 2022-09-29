class {{name.pascalCase()}}View extends StatelessWidget {
  const {{name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<{{name.pascalCase()}}Cubit>(
      create: (_) => {{name.pascalCase()}}Cubit(),
      child: const {{name.pascalCase()}}Layout(),
    );
  }
}

class {{name.pascalCase()}}Layout extends StatelessWidget {
  const {{name.pascalCase()}}Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('{{name.pascalCase()}}'),
      ),
    );
  }
}