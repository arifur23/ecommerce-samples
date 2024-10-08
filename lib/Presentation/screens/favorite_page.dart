import 'package:ecommerce_samples/Data/dataSources/data.dart';
import 'package:ecommerce_samples/Data/models/cart_item_model.dart';
import 'package:ecommerce_samples/Data/models/product.dart';
import 'package:ecommerce_samples/Domain/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_samples/Presentation/screens/product_page.dart';
import 'package:ecommerce_samples/Presentation/widgets/chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int tag = 1;

  double value = 0;

  late List<Product> products;

  late Cart cart;

  List<String> options = [
    'Summer', 'Winter', 'Shirts',
    'Pant', 'Rainny', 'Education',
    'Fashion', 'Travel', 'Food', 'Tech',
    'Science',
  ];

  Orientation orientation = Orientation.landscape;

  @override
  void initState() {
    cart =  cartRepository.cart;
    products = cartRepository.products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state){

          if(state is! CartInitial ){
            var state = BlocProvider.of<CartBloc>(context).state;
            if(state is ShopLoadedState){
              products = state.products;
              cart = state.cart;

            }
          }
          if(state is CartItemAddedState){
            BlocProvider.of<CartBloc>(context).add(CartBlocStartedEvent(cart: cart, products: products));
            var state = BlocProvider.of<CartBloc>(context).state;
            if(state is ShopLoadedState){
              products = state.products;
              cart = state.cart;

            }
          }
          if(state is CartInitial){
            BlocProvider.of<CartBloc>(context).add(CartBlocStartedEvent(cart: cart, products: products));
            var state = BlocProvider.of<CartBloc>(context).state;
            if(state is ShopLoadedState){
              products = state.products;
              cart = state.cart;
            }
          }
          if(state is CartItemRemovedState){
            BlocProvider.of<CartBloc>(context).add(CartBlocStartedEvent(cart: cart, products: products));
            var state = BlocProvider.of<CartBloc>(context).state;
            if(state is ShopLoadedState){
              products = state.products;
              cart = state.cart;
            }
          }
          if(state is CartItemDecreasedState){
            BlocProvider.of<CartBloc>(context).add(CartBlocStartedEvent(cart: cart, products: products));
            var state = BlocProvider.of<CartBloc>(context).state;
            if(state is ShopLoadedState){
              products = state.products;
              cart = state.cart;
            }
          }
          if(state is CartItemIncreasedState){
            BlocProvider.of<CartBloc>(context).add(CartBlocStartedEvent(cart: cart, products: products));
            var state = BlocProvider.of<CartBloc>(context).state;
            if(state is ShopLoadedState){
              products = state.products;
              cart = state.cart;
            }
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Favorites',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              actions: [
                Container(
                  height: 20,
                  width: 20,
                  child: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Container(
                        height: size.height * .06,
                        width: size.width,
                        child: ActionChoiceExample(options:options)),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                    child: Container(
                      height: size.height * .05,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * .3,
                            child: const Row(
                              children: [
                                Icon(Icons.filter_list,
                                    size: 25, color: Colors.black),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Filters',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width * .5,
                            child: const Row(
                              children: [
                                Icon(Icons.thumbs_up_down_outlined,
                                    size: 25, color: Colors.black),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Price lowest to high',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width * .07,
                            child: const Row(
                              children: [
                                Icon(Icons.menu_rounded,
                                    size: 25, color: Colors.black),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                        height: size.height - 260,
                        child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(0),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: (size.width) / (size.height - 250),
                            crossAxisCount: 2,
                            children: List.generate(products.length, (ind) {
                              var product = products[ind];
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (_) => ProductPage(product: products[ind])
                                  )
                                  );
                                },
                                child: Container(
                                  height: size.height * .3,
                                  width: size.width * .4,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: size.height * .22,
                                        width: size.width * .47,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.asset(
                                              product.image!,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Positioned(
                                          top: 7,
                                          left: 7,
                                          child: Container(
                                            height: 30,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Center(
                                                child: Text(
                                                  '-${product.discount}%',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.white),
                                                )),
                                          )),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: size.height * .116,
                                          width: size.width * .47,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SmoothStarRating(
                                                    allowHalfRating: false,
                                                    onRatingChanged: (v) {

                                                      setState(() {});
                                                    },
                                                    starCount: 5,
                                                    rating: value,
                                                    size: 17.0,
                                                    filledIconData: Icons.blur_off,
                                                    halfFilledIconData: Icons.blur_on,
                                                    color: Colors.orange,
                                                    borderColor: Colors.orange,
                                                    spacing:0.0
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(product.company!,
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w300,
                                                        color: Colors.black)),
                                                Text(product.name!,
                                                    style: const TextStyle(
                                                        overflow: TextOverflow.ellipsis,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w700,
                                                        color: Colors.black)),
                                                Row(
                                                  children: [
                                                    Text('${product.discount}%',
                                                        style: const TextStyle(
                                                            decoration: TextDecoration
                                                                .lineThrough,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w400,
                                                            color: Colors.black45)),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    const Text('data',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w400,
                                                            color: Colors.black45)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 70,
                                          right: 7,
                                          child: GestureDetector(
                                            onTap: (){
                                              BlocProvider.of<CartBloc>(context).add(CartAddItemEvent(
                                                  CartItemModel(
                                                      product: Product(
                                                          id: product.id,
                                                          name: product.name,
                                                          details: product.details,
                                                          ratting: product.ratting,
                                                          price: product.price,
                                                          image: product.image,
                                                          discount: product.discount,
                                                          company: product.company,
                                                          options: product.options
                                                      ),
                                                      quantity: 1
                                                  )
                                              ));
                                              BlocProvider.of<CartBloc>(context).add(CartInitialEvent());
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                content: Container(
                                                    height: 60,
                                                    child: const Center(child: Text('Your Product has been added to Cart', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),))
                                                ),
                                                duration: const Duration(seconds: 1),
                                                behavior: SnackBarBehavior.floating,
                                                margin: EdgeInsets.only(bottom: size.height - 160),
                                              ));
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(100),
                                              ),
                                              child: const Center(
                                                  child: Icon(
                                                    Icons.shopping_bag_outlined,
                                                    size: 22,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            }))),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
