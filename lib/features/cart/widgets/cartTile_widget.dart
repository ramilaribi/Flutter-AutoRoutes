import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/cart/bloc/cart_bloc.dart';
import 'package:my_app/features/home/bloc/home_bloc.dart';
import 'package:my_app/features/home/model/product.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const CartTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              productDataModel.imageUrl,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/images/placeholder.png",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.start,
            productDataModel.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productDataModel.description,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${productDataModel.price}£",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              BlocProvider(
                  create: (context) => CartBloc(),
                  child: IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartRemoveEvent(
                            productDataModel: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_bag))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
