import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        title: const Text('Account', style: TextStyle(
            fontSize: 20,
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                height: size.height * .18,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('My profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black87),),
                    const SizedBox(height: 15,),
                    Container(
                      height: size.height * .1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * .1,
                            width: size.height * .1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Expanded(
                            child: Container(
                              height: size.height * .08,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('MD Arifur Rhaman', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black.withOpacity(.7)),),
                                  const SizedBox(height: 5,),
                                  Text('arifurrhaman9@gmail.com', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black45.withOpacity(.5)),),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Ink(
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: size.height * .08,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height * .08,
                            width: size.width * .45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('My orders',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                  Text('Go to order page',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(.5)),),
                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black.withOpacity(.6),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Ink(
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: size.height * .08,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height * .08,
                            width: size.width * .7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Shipping addresses',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                  Text('Go to shipping addresses page',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(.5)),),
                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black.withOpacity(.6),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Ink(
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: size.height * .08,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height * .08,
                            width: size.width * .7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Payment methods',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                  Text('Go to payment methods page',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(.5)),),
                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black.withOpacity(.6),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Ink(
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: size.height * .08,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height * .08,
                            width: size.width * .7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Promocodes',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                  Text('Go to promocodes page',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(.5)),),
                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black.withOpacity(.6),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Ink(
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: size.height * .08,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height * .08,
                            width: size.width * .7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('My reviews',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                  Text('Go to reviews page',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(.5)),),
                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black.withOpacity(.6),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Ink(
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: size.height * .08,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height * .08,
                            width: size.width * .7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Settings',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                  Text('Go to settings page',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(.5)),),
                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black.withOpacity(.6),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
