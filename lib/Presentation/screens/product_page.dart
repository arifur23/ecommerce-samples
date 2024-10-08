import 'package:ecommerce_samples/Data/dataSources/data.dart';
import 'package:ecommerce_samples/Data/models/cart_item_model.dart';
import 'package:ecommerce_samples/Data/models/product.dart';
import 'package:ecommerce_samples/Domain/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_samples/Presentation/widgets/main_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../Data/repositories/cart_repository.dart';

class ProductPage extends StatefulWidget {
 final Product product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  double value = 0;

  CartRepository cartRepository = CartRepository();

  late List<Product> products;

  late Cart cart;

  List<String> sizes = ['Small', 'Medium', 'Large', 'Ex Large']; // Option 2
  List<String> colors = ['Red', 'Green', 'Blue', 'Pink']; // Option 2
  late String selectedSizes; // Option 2
  late String selectedColors; // Option 2

  @override
  void initState() {
    cart =  cartRepository.cart;
    products = cartRepository.products;
    selectedSizes = sizes.first;
    selectedColors = colors.first;
    super.initState();
  }

  bool isSupport = false;
  bool isShippingInfo = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              toolbarOpacity : 0,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      child: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,)
                  )
              ),
              centerTitle: true,
              title: const Text('Short dress', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),),
              actions: [
                Container(
                    height: 25,
                    width: 20,
                    child: const Icon(Icons.favorite_border, size: 20, color: Colors.black)
                ),
                const SizedBox(width: 15,),
                Container(
                    height: 205,
                    width: 20,
                    child: const Icon(Icons.share, size: 20, color: Colors.black)
                ),
                const SizedBox(width: 15,)
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    child: Column(
                      children: [
                        Container(
                          height: size.height * .45,
                          width: size.width,
                          color: Colors.blue,
                          child: Container(
                              height: size.height * .45,
                              width: size.width,
                              child: Image.asset(
                                widget.product.image!,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: size.height*.1,
                                width: size.width - 36,
                                color: Colors.transparent,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 38,
                                        width: size.width * .45,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Colors.black12, width: 1),
                                            color: Colors.white
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Size", style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54)),
                                              DropdownButton<String>( // Not necessary for Option 1
                                                value: selectedSizes,
                                                underline: Container(),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    selectedSizes = newValue!;
                                                  });
                                                },
                                                items: sizes.map((location) {
                                                  return DropdownMenuItem(
                                                    value: location,
                                                    child:  Text(location),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 38,
                                        width: size.width * .45,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Colors.black12, width: 1),
                                            color: Colors.white
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Color", style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54)),
                                              DropdownButton<String>( // Not necessary for Option 1
                                                value: selectedColors,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54),
                                                underline: Container(),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    selectedColors = newValue!;
                                                  });
                                                },
                                                items: colors.map((location) {
                                                  return DropdownMenuItem(
                                                    value: location,
                                                    child:  Text(location),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: size.width - 36,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(widget.product.company!, style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),),
                                    Row(
                                      children: [
                                        Text('৳${widget.product.price}', style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height:5),
                              Text(widget.product.name!, style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54)),
                              const SizedBox(height:5),
                              Row(
                                children: [
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
                                      color: Colors.orangeAccent,
                                      borderColor: Colors.orangeAccent,
                                      spacing:0.0
                                  ),
                                  const Text('(10)', style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54)),
                                ],
                              ),
                              const SizedBox(height:15),
                              Text(widget.product.details!, style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54)
                              ),
                              const SizedBox(height:25),
                              Container(
                                height: 45,
                                width: size.width - 36,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        BlocProvider.of<CartBloc>(context).add(CartAddItemEvent(CartItemModel(
                                            product: Product(
                                              id: widget.product.id,
                                              name: widget.product.name,
                                              details: widget.product.details,
                                              ratting: widget.product.ratting,
                                              price: widget.product.price,
                                              image: widget.product.image,
                                              discount: widget.product.discount,
                                              company: widget.product.company,
                                              options: [selectedSizes, selectedColors]
                                            ),
                                            quantity: 1
                                        )
                                        ));
                                        BlocProvider.of<CartBloc>(context).add(CartInitialEvent());
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Container(
                                              height: 70,
                                              child: const Center(child: Text('Your Product has been added to Cart', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),))
                                          ),
                                          duration: const Duration(seconds: 1),
                                          behavior: SnackBarBehavior.floating,
                                          margin: EdgeInsets.only(bottom: size.height - 90),
                                        ));
                                      },
                                      child: Container(
                                        height: 45,
                                        width: (size.width - 50)/2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: Colors.green
                                        ),
                                        child: const Center(
                                          child: Text("ADD TO CART", style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: (size.width - 50)/2,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Colors.orange
                                      ),
                                      child: const Center(
                                        child: Text("BUY NOW", style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height:35),
                              const Divider(),
                              const SizedBox(height:35)
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              isShippingInfo = !isShippingInfo;
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border.symmetric(vertical: BorderSide(width: .5, color: Colors.black54)),
                              color: Colors.white,
                            ),
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Shipping info', style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87)),
                                    RotatedBox(
                                        quarterTurns: isShippingInfo ? 1 : 0,
                                        child: const Icon(Icons.arrow_forward_ios, size: 13, color: Colors.black54,)
                                    )
                                  ]
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height:5),
                        Container(
                          child: Visibility(
                            visible: isShippingInfo,
                            child: const Column(
                              children: [
                                Text('codes are often used by businesses to allow customers,', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                                Text('codes are often used by businesses to allow customers,', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                                Text('codes are often used by businesses to allow customers ', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                                Text('codes are often used by businesses to allow customers ,', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height:5),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              isSupport = !isSupport;
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border.symmetric(vertical: BorderSide(width: .5, color: Colors.black54)),
                              color: Colors.white,
                            ),
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Support', style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87)),
                                    RotatedBox(
                                      quarterTurns: isSupport ? 1 : 0,
                                        child: const Icon(Icons.arrow_forward_ios, size: 13, color: Colors.black54,)
                                    )

                                  ]
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Visibility(
                            visible: isSupport,
                            child: const Column(
                              children: [
                                Text('codes are often used by businesses to allow customers,', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                                Text('codes are often used by businesses to allow customers,', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                                Text('codes are often used by businesses to allow customers ', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                                Text('codes are often used by businesses to allow customers ,', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height:35),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border.symmetric(vertical: BorderSide(width: .5, color: Colors.black54)),
                            // color: Colors.white,
                          ),
                          height: 40,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Product can also like this', style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                                  Text('12 items', style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54)),
                                ]
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: size.height *.35,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: products.length,
                                itemBuilder: (context, index){
                                  return MainProductWidget(product: products[index],);
                                }
                            ),
                          ),
                        ),
                        const SizedBox(height:20),

                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
