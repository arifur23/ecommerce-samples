import 'package:ecommerce_samples/Data/models/product.dart';

class Cart {
  List<CartItemModel>? cartItemModels;
  double? total;
  double? totalQuantity;

  Cart({this.cartItemModels, this.total, this.totalQuantity});

  Cart.fromJson(Map<String, dynamic> json) {
    if (json['cartItemModels'] != null) {
      cartItemModels = <CartItemModel>[];
      json['cartItemModels'].forEach((v) {
        cartItemModels!.add(CartItemModel.fromJson(v));
      });
    }
    total = json['total'];
    totalQuantity = json['totalQuantity'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cartItemModels != null) {
      data['cartItemModels'] =
          cartItemModels!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['totalQuantity'] = totalQuantity;
    return data;
  }
}

class CartItemModel {
  Product? product;
  int? quantity;

  CartItemModel({this.product, this.quantity});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quantity'] = quantity;
    return data;
  }
}


