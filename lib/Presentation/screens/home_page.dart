import 'dart:convert';
import 'package:ecommerce_samples/Data/models/cart_item_model.dart';
import 'package:ecommerce_samples/Data/repositories/cart_repository.dart';
import 'package:ecommerce_samples/Domain/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_samples/Presentation/screens/category_page.dart';
import 'package:ecommerce_samples/Presentation/widgets/footer_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:ecommerce_samples/Presentation/screens/notification_page.dart';
import 'package:ecommerce_samples/Presentation/widgets/drawer_widget.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_samples/Data/dataSources/data.dart';
import 'package:ecommerce_samples/Data/models/itunes.dart';
import 'package:ecommerce_samples/Data/models/product.dart';
import 'package:ecommerce_samples/Presentation/widgets/debounced_widget.dart';
import 'package:ecommerce_samples/Presentation/widgets/main_product_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final CarouselController controller;

  late List<Product> products;

  late Cart cart;

  ITunesItem? _selectedITunesItem;

  Future<Iterable<ITunesItem>> searchITunes(String query) async {
    if (query.isEmpty) {
      return <ITunesItem>[];
    }

    final response = await http.get(
      Uri.parse('https://itunes.apple.com/search?term=$query&media=music&limit=10'),
    );
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = List<Map<String, dynamic>>.from(data['results']);
        return results.map((result) => ITunesItem.fromJson(result)).toList();
      } else {
        throw Exception('Error searching iTunes: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (error) {
      print(error);
      return <ITunesItem>[];
    }
  }
  var categories = Data().categories;

  late CartRepository cartRepository;

  late TextEditingController textEditingController;

  @override
   void initState() {
    controller = CarouselController();
    cartRepository = CartRepository();
    cart =  cartRepository.cart;
    products = cartRepository.products;

    textEditingController = TextEditingController();
    super.initState();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state){
          // print("${state}Firstly the state");

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

            key: _scaffoldKey,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title:  Container(
                height: 90,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: (){
                            _scaffoldKey.currentState!.openDrawer();
                            print('object');
                          },
                          child: Container(
                              height: 30,
                              width: 30,
                              child: const Icon(Icons.menu_rounded, size: 24, color: Colors.black,)
                          )
                      ),
                      Container(
                        height: 90,
                        width: size.width * .71,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          // color: Colors.black.withOpacity(.05)
                        ),
                        child: Transform.translate(
                          offset: const Offset(0, 0),
                          child: Stack(
                            children: [
                              DebouncedSearchBar<ITunesItem>(
                                hintText: 'Search',
                                onResultSelected: (ITunesItem result) {
                                  setState(() {
                                    _selectedITunesItem = result;
                                  });
                                },
                                resultToString: (ITunesItem result) => result.trackName,
                                resultTitleBuilder: (ITunesItem result) => Text(result.trackName),
                                resultSubtitleBuilder: (ITunesItem result) => Text(result.artistName),
                                resultLeadingBuilder: (ITunesItem result) => result.artworkUrl30 != null
                                    ? Image.network(result.artworkUrl30!)
                                    : const Icon(Icons.music_note),
                                searchFunction: searchITunes,
                              ),
                              Positioned(
                                top: 25,
                                  left: size.width * .14,
                                  child: MouseRegion(
                                    opaque: false,
                                      child: Text('Search products',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.4)),)
                                  )
                              )
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const NotificationPage())
                          );
                        },
                        child: Container(
                            height: 25,
                            width: 25,
                            child: const Icon(Icons.notifications, size: 26, color: Colors.black)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            drawer: const DrawerWidget(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                    child: Container(
                      height: size.height * .17,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: InfiniteCarousel.builder(
                        itemCount: 10,

                        itemExtent: size.width,
                        center: true,
                        anchor: 0.0,
                        velocityFactor: 0.2,
                        onIndexChanged: (index) {},
                        controller: controller,
                        axisDirection: Axis.horizontal,
                        loop: true,
                        itemBuilder: (context, itemIndex, realIndex) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 10),
                            child: Container(
                              height: size.height * .17,
                              width: size.width - 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                      width: size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          'assets/shop3.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Container(
                    height: size.height * .19,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Categories', style: TextStyle(fontSize: 19, color: Colors.black87, fontWeight: FontWeight.bold),),
                          const SizedBox(height: 20,),
                          Container(
                            height: size.height * .13,
                            width: size.width,
                            child: InfiniteCarousel.builder(
                              itemCount: categories.length,
                              itemExtent: size.width * .192,
                              center: true,
                              anchor: 0.0,
                              velocityFactor: 0.2,
                              onIndexChanged: (index) {},
                              controller: controller,
                              axisDirection: Axis.horizontal,
                              loop: true,
                              itemBuilder: (context, itemIndex, realIndex) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (_)=> CategoryPage(name: categories[itemIndex].name, id: categories[itemIndex].id,)
                                    )
                                    );
                                  },
                                  child: Container(
                                    height: size.height * .12,
                                    width: size.width * .18,
                                    child: Column(
                                      children: [
                                        Container(
                                            height: size.height * .06,
                                            width: size.height * .06,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.green.withOpacity(.1)
                                            ),
                                            child: Center(child: Icon(categories[itemIndex].iconData, size: 20,))
                                        ),
                                        const SizedBox(height: 7,),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                            child: Text(categories[itemIndex].name, style: const TextStyle(overflow: TextOverflow.visible, fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w700),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: size.height * .462,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Sale',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              Text('View all',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text('Super Summer Sale',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45,
                              )),
                        ),
                        const SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: size.height *.35,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: products.length,
                                itemBuilder: (context, index){
                                  return  MainProductWidget(product: products[index],);
                                  // return Text('data');
                                }
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: size.height * .462,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('New',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.8),
                                  )),
                              const Text('View all',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text('You have seen if before',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45,
                              )),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: size.height *.35,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: products.length,
                                itemBuilder: (context, index){

                                  return MainProductWidget(product: products[index]);

                                  // return Text('data');

                                }
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: size.height * .5,
                    width: size.width,
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * .5,
                          width: size.width,
                          child: Image.asset('assets/shop1.jpg', fit: BoxFit.cover,),
                        ),
                        const Positioned(
                            bottom: 30,
                            right: 20,
                            child: Text('New collection', style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ))
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: size.height * .462,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Featured',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.8),
                                  )),
                              const Text('View all',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text('Those will amaze you',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45,
                              )),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: size.height *.35,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: products.length,
                                itemBuilder: (context, index){

                                  return MainProductWidget(product: products[index]);

                                  // return Text('data');

                                }
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: (size.height * .2) - 30,
                    width: size.width,
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * .2,
                          width: size.width,
                          child: Image.asset('assets/shop4.jpg', fit: BoxFit.cover,),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: (size.height * .2) - 30,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(.93),
                                borderRadius: BorderRadius.circular(0),
                                // color: Colors.black
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20,),
                                  Center(
                                    child: Text('Subscribe to our newsletters', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(.96),
                                    )),
                                  ),
                                  const SizedBox(height: 15,),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 45,
                                          width: size.width * .85,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            color: Colors.white.withOpacity(.96)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                height: 45,
                                                width: (size.width * .61),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                  child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(4.0),
                                                      child: TextField(
                                                        controller: textEditingController,
                                                          decoration : InputDecoration(
                                                            hintText: 'example@gmail.com',
                                                            hintStyle: TextStyle(fontSize: 16, color: Colors.black.withOpacity(.5)),
                                                            border: InputBorder.none
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 37,
                                                width: size.width * .2,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(25)
                                                ),
                                                child: Center(
                                                  child: TextButton(
                                                      onPressed: (){},
                                                      child: const Center(child: Text('Submit', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),))
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20,),

                                ],
                              ),
                            )
                        ),

                      ],
                    ),
                  ),

                  footer_widget(size: size)
                ],
              ),
            ),
          );
        }
    );
  }
}


