part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}


class HomeLoadedSucessState extends HomeState {
  final List<ProductDataModel>  products ;

  HomeLoadedSucessState({required this.products});


}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageState extends HomeActionState {}

class HomeNavigateToCartPageState extends HomeActionState {}

// this state for the buttons inside the item

class HomeProductCardedState extends HomeActionState {}

class HomeProductWishListedState extends HomeActionState {}