part of 'cart_bloc.dart';

@immutable
sealed class CartEvent extends Equatable {}

class CartInitialEvent extends CartEvent{



  CartInitialEvent();

  @override
  List<Object> get props => [];
}

class CartBlocStartedEvent extends CartEvent{

  final List<Product> products;
  final Cart cart;

  CartBlocStartedEvent({required this.products, required this.cart});

  @override
  List<Object> get props => [cart, products];
}

class CartAddItemEvent extends CartEvent{
  @override
  List<Object?> get props => [];

  final CartItemModel cartItemModel;

  CartAddItemEvent(this.cartItemModel);
}

class CartRemoveItemEvent extends CartEvent{
  @override
  List<Object?> get props => [];
  final CartItemModel cartItemModel;

  CartRemoveItemEvent(this.cartItemModel);
}

class CarItemIncreaseQuantityEvent extends CartEvent{
  @override
  List<Object?> get props => [];
  final CartItemModel cartItemModel;

  CarItemIncreaseQuantityEvent(this.cartItemModel);
}

class CarItemDecreaseQuantityEvent extends CartEvent{
  @override
  List<Object?> get props => [];

  final CartItemModel cartItemModel;

  CarItemDecreaseQuantityEvent(this.cartItemModel);
}

class GetCartAllEvent extends CartEvent{
  @override
  List<Object?> get props => [];
  final Cart cart;
  GetCartAllEvent(this.cart);

}