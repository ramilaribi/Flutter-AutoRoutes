import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPage();
}

class _WishListPage extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
        body: Text(
      "this is WishList Page",
      style: TextStyle(color: Colors.red),
    ));
  }
}
