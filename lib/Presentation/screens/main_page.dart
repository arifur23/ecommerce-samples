import 'package:ecommerce_samples/Data/models/cart_item_model.dart';
import 'package:ecommerce_samples/Data/models/product.dart';
import 'package:ecommerce_samples/Domain/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_samples/Presentation/screens/account_page.dart';
import 'package:ecommerce_samples/Presentation/screens/favorite_page.dart';
import 'package:ecommerce_samples/Presentation/screens/home_page.dart';
import 'package:ecommerce_samples/Presentation/screens/my_bag_page.dart';
import 'package:ecommerce_samples/Presentation/screens/shop_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

Future<void> onRefresh()async {

}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {

  late List<Product> products;

  late Cart cart;

  void initialization() async {
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  int _selectedIndex = 2;

  List<Widget> screens = [
    const ShopPage(),
    const MyBagPage(),
    const HomePage(),
    const FavoritePage(),
    AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
    cart =  cartRepository.cart;
    products = cartRepository.products;

    initialization();
  }
  @override
  Widget build(BuildContext context) {

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
            bottomNavigationBar: Stack(
              children: [
                FlashyTabBar(
                  selectedIndex: _selectedIndex,
                  showElevation: true,
                  onItemSelected: (index) => setState(() {
                    _selectedIndex = index;
                  }),
                  items: [
                    FlashyTabBarItem(
                      icon: Icon(Icons.shopping_cart_outlined, color: Colors.red,),
                      title: Text('Shop'),
                    ),
                    FlashyTabBarItem(
                      icon: Icon(Icons.shopping_bag_outlined, color: Colors.red,),
                      title: Text('Bag'),
                    ),
                    FlashyTabBarItem(
                      icon: Icon(Icons.home_outlined, color: Colors.red,),
                      title: Text('Home'),
                    ),
                    FlashyTabBarItem(
                      icon: Icon(Icons.favorite_border, color: Colors.red,),
                      title: Text('Favorite'),
                    ),
                    FlashyTabBarItem(
                      icon: Icon(Icons.account_circle_outlined, color: Colors.red,),
                      title: Text('Account'),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 40,
                    left: 130,
                    child: Container(
                      // height: 20,
                      // width: 20,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        child: Text((cart.totalQuantity?.toInt()).toString(), style: const TextStyle(fontSize: 10 ,color: Colors.white)),
                      ),
                    )
                )
              ],
            ),




            body: screens[_selectedIndex],
          );
        }
    );

  }
}

