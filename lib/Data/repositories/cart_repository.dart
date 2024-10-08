import 'dart:convert';

import 'package:ecommerce_samples/Data/dataSources/data.dart';
import 'package:ecommerce_samples/Data/models/cart_item_model.dart';
import 'package:ecommerce_samples/Data/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository{

  Data  data = Data();

  late SharedPreferences prefs;

  List<Product> products = Data.products;

  Cart cart = Cart(cartItemModels: [], total: 0, totalQuantity: 0);

  Future<Cart> getCart()async{
    prefs = await SharedPreferences.getInstance();
    var stringCart = jsonEncode(cart.toJson());
    prefs.setString('cart',  stringCart);

    String? cartString = await prefs.getString('cart');

    Cart shoppingCart = Cart.fromJson(jsonDecode(cartString!));

    if(shoppingCart.cartItemModels?.isNotEmpty ?? false){
    }
    else{
      print('shopping cart item is empty $cartString');
    }

    return shoppingCart;
  }

  Future<List<Product>> getProducts()async{
    List<Product> shoppProducts = await products;
    return shoppProducts;
  }

  Future<void> addItemToCart(CartItemModel cartItem) async {

    prefs = await SharedPreferences.getInstance();

    cart = await getCart();

    var isExist = cart.cartItemModels!.where((element) => element.product!.id == cartItem.product!.id);
    if (isExist.isEmpty) {
      cart.cartItemModels!.add(CartItemModel(
        product: cartItem.product,
        quantity: 1,
      ));
      cart.total = cart.total! + cartItem.product!.price!;
      cart.totalQuantity = cart.totalQuantity! + 1;
    } else {
      isExist.first.quantity = (isExist.first.quantity! + 1);
      cart.total = cart.total! + cartItem.product!.price!;
      cart.totalQuantity = cart.totalQuantity! + 1;
    }


    prefs.setString('cart',  cart.toJson().toString());

  }

  Future<void> increaseItemByOne(CartItemModel cartItem)async{

    cart = await getCart();

    var isExist = cart.cartItemModels!.where((element) => element.product!.id == cartItem.product!.id);
    if (isExist.isEmpty) {
      cart.cartItemModels!.add(CartItemModel(
        product: cartItem.product,
        quantity: 1,
      ));
      cart.total = cart.total! + cartItem.product!.price!;
      cart.totalQuantity = cart.totalQuantity! + 1;
    } else {
      isExist.first.quantity = (isExist.first.quantity! + 1);
      cart.total = cart.total! + cartItem.product!.price!;
      cart.totalQuantity = cart.totalQuantity! + 1;
    }

    prefs.setString('cart',  cart.toJson().toString());
  }

  Future<void> removeByOneItemFromCart(CartItemModel cartItem) async{

    cart = await getCart();

    var isExist = cart.cartItemModels!.where((element) => element.product!.id == cartItem.product!.id);
    if (isExist.isEmpty) {
      cart.cartItemModels!.add(CartItemModel(
        product: cartItem.product,
        quantity: 1,
      ));
      cart.total = cart.total! - cartItem.product!.price!;
      cart.totalQuantity = cart.totalQuantity! - 1;
    } else {
      if(isExist.first.quantity! > 1){
        isExist.first.quantity = (isExist.first.quantity! - 1);
        cart.total = cart.total! - cartItem.product!.price!;
        cart.totalQuantity = cart.totalQuantity! - 1;
      }
      else{
        print("Can not decrease");
      }
    }
    prefs.setString('cart', cart.toString());
  }

  Future<void> removeItemFromCart(CartItemModel cartItem) async{

    cart = await getCart();

    var isExist = cart.cartItemModels!.where((element) => element.product!.id == cartItem.product!.id);

    if (isExist.isEmpty) {
    } else {
      if(isExist.first.quantity! >= 1){
        cart.total = cart.total! - (isExist.first.product!.price! * isExist.first.quantity!);
        cart.totalQuantity = cart.totalQuantity! - (isExist.first.quantity!);
        cart.cartItemModels!.remove(isExist.first);
      }
    }

    prefs.setString('cart',  cart.toJson().toString());
  }

  Future<int> checkCartItem() async{
    int len = 0;

    return len;
  }

}