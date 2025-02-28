import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:my_app/core/cubit/falvor_cubit.dart";
import "package:my_app/features/routes/app_router.dart";

final _router = AppRouter();

class App extends StatelessWidget {
  final String flavor;

  const App({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FalvorCubit(flavor),
      child: MaterialApp.router(
        routerConfig: _router.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
      ),
    );
  }
}
