part of 'cart_bloc.dart';
CartRepository cartRepository = CartRepository();
@immutable
sealed class CartState extends Equatable {
  const CartState();
}

 class CartInitial extends CartState {

  @override
  List<Object> get props => [];
}

class ShopLoadedState extends CartState{

  // TODO: implement props

   final List<Product> products;
   final Cart cart;
   @override
   List<Object?> get props => [cart, products];
   const ShopLoadedState({required this.products, required this.cart});

}

class CartItemAddedState extends CartState{


  final Cart cart;

  const CartItemAddedState(this.cart);
  @override
  List<Object> get props => [cart];
}

class CartItemRemovedState extends CartState{


  final Cart cart;
  const CartItemRemovedState(this.cart);
  @override
  List<Object> get props => [cart];
}

class CartItemIncreasedState extends CartState{

  final Cart cart;
  const CartItemIncreasedState(this.cart);
  @override
  List<Object> get props => [cart];
}

class CartItemDecreasedState extends CartState{

  final Cart cart;
  const CartItemDecreasedState(this.cart);
  @override
  List<Object> get props => [cart];
}

class CartAllState extends CartState{

  final Cart cart;
  const CartAllState(this.cart);
  @override
  List<Object> get props => [cart];
}




