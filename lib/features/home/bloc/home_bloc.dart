import 'dart:async';

import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/data/cart_items.dart';
import 'package:my_app/data/products_dummy_data.dart';
import 'package:my_app/data/wishList_items.dart';
import 'package:my_app/features/home/model/product.dart';

// Importing the event and state files
part 'home_event.dart';
part 'home_state.dart';

/// The `HomeBloc` class is responsible for managing state transitions
/// in response to user interactions (events) within the home screen.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// Constructor: Initializes the bloc with an initial state (`HomeInitial`).
  HomeBloc() : super(HomeInitial()) {
// init state
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeBtnCartClickedEvent>(homeBtnCartClickedEvent);
    on<HomeBtnWishlistClickedEvent>(homeBtnWishlistClickedEvent);

// app Bar btns state navigation

    on<HomeBtnWishlistNavigateEvent>(homeBtnWishlistNavigateEvent);
    on<HomeBtnCartNavigateEvent>(homeBtnCartNavigateEvent);
  }

  FutureOr homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(HomeLoadedSucessState(
        products: ProductData.productsData
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                category: e['category'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  /// Handler for `HomeBtnCartClickedEvent`
  /// This is triggered when the "Add to Cart" button is clicked.

  FutureOr homeBtnCartClickedEvent(
      HomeBtnCartClickedEvent event, Emitter<HomeState> emit) {
    print("Cart clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductCardedState());
  }

  FutureOr homeBtnWishlistClickedEvent(
      HomeBtnWishlistClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist clicked");
    wishListItems.add(event.clickedProduct);
    emit(HomeProductWishListedState());
  }

  FutureOr homeBtnWishlistNavigateEvent(
      HomeBtnWishlistNavigateEvent event, Emitter<HomeState> emit) {
    print("Navigating to Wishlist");
    emit(HomeNavigateToWishListPageState());
  }

  FutureOr homeBtnCartNavigateEvent(
      HomeBtnCartNavigateEvent event, Emitter<HomeState> emit) {
    print("Navigating to Cart");
    emit(HomeNavigateToCartPageState());
  }

  FutureOr homeProductCardedState(
      HomeProductCardedState event, Emitter<HomeState> emit) {
    print("Product Carded");
  }

  FutureOr homeProductWishListedState(
      HomeProductWishListedState event, Emitter<HomeState> emit) {
    print("Product WishListed");
  }
}
