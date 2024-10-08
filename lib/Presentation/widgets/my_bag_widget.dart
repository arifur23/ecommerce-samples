import 'package:ecommerce_samples/Data/models/cart_item_model.dart';
import 'package:ecommerce_samples/Domain/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SampleItem { itemOne, itemTwo }

class MyBagWidget extends StatefulWidget {
  final CartItemModel? cartItemModel;

  const MyBagWidget({super.key, required this.cartItemModel});

  @override
  State<MyBagWidget> createState() => _MyBagWidgetState();
}

class _MyBagWidgetState extends State<MyBagWidget> {

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


    OverlayEntry _createOverlay( CartBloc cartBloc) {

      return OverlayEntry(
        builder: (context)
        {
          Size size = MediaQuery.of(context).size;
         return GestureDetector(

            child: BlocProvider<CartBloc>.value(
              value: cartBloc,
              child: Positioned(
                top: size.height * .4,
                left: size.width * .2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: size.height * .2,
                        width: size.width * .6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    removeHighlightOverlay();
                                  },
                                  child: Container(
                                    height: 50,
                                    child: const Center(
                                      child: Text('Add to favorite', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54,)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Divider(),
                              const SizedBox(height: 10,),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    // BlocProvider.of<CartBloc>(context).add(CartRemoveItemEvent(CartItemModel(product: widget.cartItemModel!.product, quantity: widget.cartItemModel!.quantity)));
                                    context.read<CartBloc>().add(CartRemoveItemEvent(CartItemModel(product: widget.cartItemModel!.product, quantity: widget.cartItemModel!.quantity)));
                                    // Overlay.of(context, debugRequiredFor: widget).deactivate();
                                    context.read<CartBloc>().add(CartInitialEvent());
                                    setState(() {

                                    });
                                    overlayEntry!.remove();
                                  },
                                  child: Container(
                                    height: 50,
                                    child: const Center(

                                      child: Text('Delete from the list', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54,)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      );
    }

    Overlay.of(context, debugRequiredFor: widget).insert(_createOverlay(context.read<CartBloc>()));
    Overlay.of(context, debugRequiredFor: widget).deactivate();
  }

  // Remove the OverlayEntry.
  void removeHighlightOverlay() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  @override
  void dispose() {
    // Make sure to remove OverlayEntry when the widget is disposed.
    super.dispose();
  }

  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: size.height * .14,
        width: size.width - 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              height: size.height * .14,
              width: size.height * .14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                child: Image.asset(widget.cartItemModel!.product!.image!, fit: BoxFit.cover,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Container(
                height: size.height * .14,
                width: size.width - (size.height * .14) - 52,
                child: Column(
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                          child: Text(widget.cartItemModel!.product!.name!,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )
                          ),
                        ),
                        Container(
                          height: 24,
                          width: 25,
                          child: BlocListener<CartBloc, CartState>(
                              listener: (context, state){
                              },
                              child: PopupMenuButton<SampleItem>(
                              initialValue: selectedItem,
                              onSelected: (SampleItem item) {
                                setState(() {
                                  selectedItem = item;
                                });

                                if(item == SampleItem.itemTwo){
                                  // BlocProvider.of<CartBloc>(context).add(CartRemoveItemEvent(CartItemModel(product: widget.cartItemModel!.product, quantity: widget.cartItemModel!.quantity)));
                                  context.read<CartBloc>().add(CartRemoveItemEvent(CartItemModel(product: widget.cartItemModel!.product, quantity: widget.cartItemModel!.quantity)));
                                  BlocProvider.of<CartBloc>(context).add(CartInitialEvent());
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Container(
                                        height: 60,
                                        child: const Center(child: Text('Your Product has been removed from Cart', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),))
                                    ),
                                    duration: const Duration(seconds: 1),
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.only(bottom: size.height - 160),
                                  ));
                                }
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                                PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemOne,
                                  child: Container(
                                      height: 50,
                                      width: 150,
                                      child: const Center(child: Text('Add To Favorite'))
                                  ),
                                ),
                                PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemTwo,
                                  child: Container(
                                      height: 50,
                                      width: 150,
                                      child: const Center(child: Text('Delete from Cart'))
                                  ),
                                ),
                              ],
                            ),
                          )

                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Color:',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            )
                        ),
                        const SizedBox(width: 6,),
                        Text( widget.cartItemModel!.product!.options?.elementAt(0) ?? 'Grey',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )
                        ),
                        const SizedBox(width: 20,),
                        const Text( 'Size',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            )
                        ),
                        const SizedBox(width: 10,),
                        Text( widget.cartItemModel!.product!.options?.elementAt(1) ??'L',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),

                    Row(
                      children: [
                        GestureDetector(
                          onTap:(){
                            BlocProvider.of<CartBloc>(context).add(CarItemDecreaseQuantityEvent(CartItemModel(product: widget.cartItemModel!.product, quantity: widget.cartItemModel!.quantity)));
                            BlocProvider.of<CartBloc>(context).add(CartInitialEvent());
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Container(
                                  height: 60,
                                  child: const Center(child: Text('Your Product has been decreased from Cart', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),))
                              ),
                              duration: const Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(bottom: size.height - 160),
                            ));
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: Offset(0, .5)
                                )
                              ]
                            ),
                            child: const Center(
                              child: Icon(Icons.remove, size: 15, color: Colors.black,),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Text(widget.cartItemModel!.quantity.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            )
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            BlocProvider.of<CartBloc>(context).add(CarItemIncreaseQuantityEvent(CartItemModel(product: widget.cartItemModel!.product, quantity: widget.cartItemModel!.quantity)));
                            BlocProvider.of<CartBloc>(context).add(CartInitialEvent());
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Container(
                                  height: 60,
                                  child: const Center(child: Text('Your Product has been added into Cart', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),))
                              ),
                              duration: const Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(bottom: size.height - 160),
                            ));
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: Offset(0, .5)
                                  )
                                ]
                            ),
                            child: const Center(
                              child: Icon(Icons.add, size: 15, color: Colors.black,),
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * .16,),
                        Text(((widget.cartItemModel!.product!.price! * widget.cartItemModel!.quantity!).toString()), style: TextStyle( fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black,)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
