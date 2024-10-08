import 'package:ecommerce_samples/Data/models/cart_item_model.dart';
import 'package:ecommerce_samples/Data/models/product.dart';
import 'package:ecommerce_samples/Domain/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_samples/Presentation/screens/product_page.dart';
import 'package:ecommerce_samples/Presentation/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class MainProductWidget extends StatefulWidget {
  final Product product;

  const MainProductWidget({super.key, required this.product});

  @override
  State<MainProductWidget> createState() => _MainProductWidgetState();
}

class _MainProductWidgetState extends State<MainProductWidget> {

   double value = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (_) => ProductPage(product: widget.product,)
          )
          );
        },
        child: Container(
          height: size.height * .35,
          width: size.width * .4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5)
          ),
          child: Stack(
            children: [

              Container(
                height: size.height * .22,
                width: size.width * .4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(widget.product.image!, fit: BoxFit.cover,)
                ),
              ),
              Positioned(
                  top: 7,
                  left: 7,
                  child: Container(
                    height: 30,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(child: Text('-${widget.product.discount}%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),)),
                  )
              ),

              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: size.height * .116,
                  width: size.width * .4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
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
                        const SizedBox(height: 5,),
                        Text(widget.product.company! , style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black)),
                        Text(widget.product.name!, style: const TextStyle( overflow: TextOverflow.ellipsis,fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black)),
                        Row(
                          children: [
                            Text('${widget.product.discount}%', style: const TextStyle(decoration: TextDecoration.lineThrough, fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black45)),
                            const SizedBox(width: 4,),
                            const Text('data', style: TextStyle( fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black45)),
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

                      // if(state is CartItemAddedState){
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
                                options: widget.product.options
                            ),
                            quantity: 1
                        )));

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
                      child: const Center(child: Icon(Icons.shopping_bag_outlined, size: 22, color: Colors.black,)),
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
