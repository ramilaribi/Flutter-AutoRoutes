part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}


class HomeBtnWishlistClickedEvent extends HomeEvent {
    final ProductDataModel clickedProduct;

  HomeBtnWishlistClickedEvent({required this.clickedProduct});


}

class HomeBtnCartClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeBtnCartClickedEvent({required this.clickedProduct});
}

class HomeBtnWishlistNavigateEvent extends HomeEvent {}

class HomeBtnCartNavigateEvent extends HomeEvent {}


