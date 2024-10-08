import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class footer_widget extends StatelessWidget {
  const footer_widget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .45,
      width: size.width,
      color: Colors.red.withOpacity(.3),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 30, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: size.height * .12,
                  width: (size.width/2) - 18,
                  child: Column(
                    children: [
                      const Text('NEED HELP?', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      )),
                      const SizedBox(height: 10,),
                      Container(
                        height: 2,
                        width: (size.width/2) * .5,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10,),
                      const Text('Increase contrast', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                      const Text('Share Locator', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: size.height * .12,
                  width: (size.width/2) - 18,
                  child: Column(
                    children: [
                      const Text('CONTACT US', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      )),
                      const SizedBox(height: 10,),
                      Container(
                        height: 2,
                        width: (size.width/2) * .5,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10,),
                      const Text('Contact Us', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                      const Text('Careers', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  height: size.height * .13,
                  width: (size.width/2) - 18,
                  child: Column(
                    children: [
                      const Text('LEGAL', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      )),
                      const SizedBox(height: 10,),
                      Container(
                        height: 2,
                        width: (size.width/2) * .5,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10,),
                      const Text('Legal terms', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                      const Text('Privacy Policy', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                      const Text('Notice about', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)), ],
                  ),
                ),
                Container(
                  height: size.height * .13,
                  width: (size.width/2) - 18,
                  child: Column(
                    children: [
                      const Text('CATEGORIES', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      )),
                      const SizedBox(height: 10,),
                      Container(
                        height: 2,
                        width: (size.width/2) * .5,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      const Text('Contact Us', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                                      const Text('Contact Us', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                                      const Text('Careers', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),

                                    ],
                                  ),
                                ),
                                // Container(
                                //   child: Column(
                                //     children: [
                                //       const Text('Contact Us', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                                //       const Text('Contact Us', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                                //       const Text('Careers', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black,)),
                                //
                                //     ],
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            Container(
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  const Text('FOLLOW US', style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  )),
                  const SizedBox(height: 10,),
                  Container(
                    height: 2,
                    width: size.width * .3,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 40,
                    width: size.width * .8,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FaIcon(FontAwesomeIcons.twitter),
                        FaIcon(FontAwesomeIcons.facebook),
                        FaIcon(FontAwesomeIcons.instagram),
                        FaIcon(FontAwesomeIcons.youtube),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}