import 'package:bloc/bloc.dart';
import 'package:ecommerce_samples/Data/models/cart_item_model.dart';
import 'package:ecommerce_samples/Data/models/product.dart';
import 'package:ecommerce_samples/Data/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  late Cart cart = Cart();

  CartRepository cartRepository = CartRepository();

  CartBloc() : super(CartInitial()) {

    on<CartBlocStartedEvent>(_onShopLoadedEvent);
    on<CartInitialEvent>(_onCartInitialEvent);
    on<CartAddItemEvent>(_onItemAddedEvent);
    on<CartRemoveItemEvent>(_opItemRemoveEvent);
    on<CarItemIncreaseQuantityEvent>(_onItemIncreaseEvent);
    on<CarItemDecreaseQuantityEvent>(_onItemDecreaseEvent);
    on<GetCartAllEvent>(_onCartAll);

  }

  _onCartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) async {



    emit(CartInitial());
  }

_onShopLoadedEvent(CartBlocStartedEvent event, Emitter<CartState> emit) async{
  Cart cart = await cartRepository.getCart();
  List<Product> products = await cartRepository.getProducts();
  emit(ShopLoadedState(cart: cart, products: products));
}

  _onItemAddedEvent(CartAddItemEvent event, Emitter<CartState> emit) async {
    await cartRepository.addItemToCart(event.cartItemModel);
    Cart cart = await cartRepository.getCart();
    emit(CartItemAddedState(cart));
  }

  _opItemRemoveEvent(CartRemoveItemEvent event, Emitter<CartState> emit) async {

    await cartRepository.removeItemFromCart(event.cartItemModel);

    Cart cart = await cartRepository.getCart();
    emit(CartItemRemovedState(cart));
  }

  _onItemIncreaseEvent(CarItemIncreaseQuantityEvent event, Emitter<CartState> emit) async {
    cartRepository.increaseItemByOne(event.cartItemModel);
    Cart cart = await cartRepository.getCart();

    emit(CartItemIncreasedState(cart));
  }

  _onItemDecreaseEvent(CarItemDecreaseQuantityEvent event, Emitter<CartState> emit) async {
    cartRepository.removeByOneItemFromCart(event.cartItemModel);
    Cart cart = await cartRepository.getCart();

    emit(CartItemDecreasedState(cart));
  }

  _onCartAll(GetCartAllEvent event, Emitter<CartState> emit) async {

    Cart cart = await cartRepository.getCart();
    emit(CartAllState(cart));
  }
}
