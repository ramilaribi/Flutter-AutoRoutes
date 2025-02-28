import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/cart/bloc/cart_bloc.dart';
import 'package:my_app/features/cart/widgets/cartTile_widget.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc()..add(CartInitialEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) => State is CartActionState,
        buildWhen: (previous, current) => State is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadingState:
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            case CartSucessState:
              final successState = state as CartSucessState;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.cyan,
                  title: const Text("Products Shoped"),
                ),
                body: ListView.builder(
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTileWidget(
                          productDataModel: successState.cartItems[index]);
                    }),
              );
            default:
              return const SizedBox(
                child: Text("default"),
              );
          }
        },
      ),
    );
  }
}
