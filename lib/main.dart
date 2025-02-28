import "package:flutter/material.dart";
import "package:my_app/features/routes/app_router.dart";

void main(){
  runApp(MyApp());
}

final _router = AppRouter();

class MyApp extends StatelessWidget{
  const MyApp({super.key});

@override
  Widget build(BuildContext context) {
  return MaterialApp.router(
    routerConfig: _router.config(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    );
  }
}


