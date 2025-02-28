import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/cubit/falvor_cubit.dart';
import 'package:my_app/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/home/widgets/product_tile_widget.dart';
import 'package:my_app/features/routes/app_router.gr.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Using FlavorCubit within this widget only
    final flavor = context.watch<FalvorCubit>().state;

    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeInitialEvent()),

      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToCartPageState) {
            context.router.push(const CartRoute());
          } else if (state is HomeNavigateToWishListPageState) {
            context.router.push(const WishListRoute());
          } else if (state is HomeProductCardedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product Shoped ✅")));
          } else if (state is HomeProductWishListedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product WishListed ✅")));
          }
        },
        builder: (context, state) {
          // Handling UI based on the current state
          if (state is HomeLoadingState) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is HomeLoadedSucessState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(238, 38, 160, 236),
                title: Text("Demo bloc $flavor"), 
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(HomeBtnWishlistNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(HomeBtnCartNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(productDataModel: state.products[index]);
                },
              ),
            );
          } else if (state is HomeErrorState) {
            return const Scaffold(body: Center(child: Text("Error")));
          } else {
            return const Scaffold(body: Center(child: Text("Unknown state")));
          }
        },
      ),
    );
  }
}
