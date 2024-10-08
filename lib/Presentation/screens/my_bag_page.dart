import 'package:ecommerce_samples/Data/dataSources/data.dart';
import 'package:ecommerce_samples/Data/models/cart_item_model.dart';
import 'package:ecommerce_samples/Data/models/product.dart';
import 'package:ecommerce_samples/Domain/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_samples/Presentation/widgets/my_bag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({super.key});

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {

  OverlayEntry? overlayEntry;
  int currentPageIndex = 0;

  void createHighlightOverlay({
    required AlignmentDirectional alignment,
    required Color borderColor,
  }) {
    // Remove the existing OverlayEntry.
    removeHighlightOverlay();

    assert(overlayEntry == null);

    Widget builder(BuildContext context) {
      final (String label, Color? color) = switch (currentPageIndex) {
        0 => ('Explore page', Colors.red),
        1 => ('Commute page', Colors.green),
        2 => ('Saved page', Colors.orange),
        _ => ('No page selected.', null),
      };
      if (color == null) {
        return Text(label);
      }
      return Column(
        children: <Widget>[
          Text(label, style: TextStyle(color: color)),
          Icon(Icons.arrow_downward, color: color),
        ],
      );
    }

    overlayEntry = OverlayEntry(
      // Create a new OverlayEntry.
      builder: (BuildContext context) {
        // Align is used to position the highlight overlay
        // relative to the NavigationBar destination.
        return SafeArea(
          child: Align(
            alignment: alignment,
            heightFactor: 1.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Tap here for'),
                  Builder(builder: builder),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 80.0,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    // Add the OverlayEntry to the Overlay.
    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  late List<Product> products;
  late Cart cart;

  // Remove the OverlayEntry.
  void removeHighlightOverlay() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  @override
  void initState() {
    cart =  cartRepository.cart;
    products = cartRepository.products;
    super.initState();
  }

  @override
  void dispose() {
    removeHighlightOverlay();
    super.dispose();
  }

  Future<void> onRefresh()async{
    setState(() {
      BlocProvider.of<CartBloc>(context).add(CartInitialEvent());
    });
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

          return RefreshIndicator(
              onRefresh: onRefresh,
              child: Scaffold(
                appBar: AppBar(actions: [
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    width: 15,
                  )
                ]),
                body: Container(
                  height: size.height + 5,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('My Bag',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        if (cart.cartItemModels!.isNotEmpty)
                          Container(
                            height: size.height * .48,
                            width: size.width,
                            child: ListView.builder(
                                itemCount: cart.cartItemModels!.length,
                                itemBuilder: (context, index) {
                                  return MyBagWidget(cartItemModel: cart.cartItemModels![index],);
                                  // return Text('dfkl');
                                }),
                          )
                        else Container(
                            height: size.height * .48,
                            width: size.width,
                            child: const Center(
                              child: Text('Your cart is Empty'),
                            )
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: size.width - 36,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black12),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('mypromocode2024',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    )),
                                Icon(
                                  Icons.close,
                                  size: 18,
                                  color: Colors.black45,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total amount',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  )),
                              Text((cart.total).toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: (){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Container(
                                  height: 60,
                                  child: const Center(child: Text('This feature has not been created yet.', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),))
                              ),
                              duration: const Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(bottom: size.height - 160),
                            ));
                          },
                          child: Container(
                            height: 50,
                            width: size.width - 36,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                                child: Text('CHECK OUT',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          );
        }
    );
  }
}
