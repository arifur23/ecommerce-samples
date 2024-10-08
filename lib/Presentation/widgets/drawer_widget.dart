import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width * .6,
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          const SizedBox(height: 30,),
          Container(
            height: size.height *.12,
            child: const Center(
              child: Text('Ivaly', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 40),),
            ),
          ),
          ListTile(
            onTap: (){

            },
            leading: const Icon(Icons.home_outlined, size: 26, color: Colors.black,),
            title: const Text('Home', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),),
          ),
          ListTile(
            onTap: (){

            },
            leading: const Icon(Icons.login_outlined, size: 26, color: Colors.black,),
            title: const Text('Sign In', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),),
          ),
          ListTile(
            onTap: (){

            },
            leading: const Icon(Icons.favorite_border, size: 26, color: Colors.black,),
            title: const Text('Favorite', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),),
          ),
          ListTile(
            onTap: (){

            },
            leading: const Icon(Icons.phone_outlined, size: 26, color: Colors.black,),
            title: const Text('Contact Us', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),),
          ),
          ListTile(
            onTap: (){

            },
            leading: const Icon(Icons.copy, size: 26, color: Colors.black,),
            title: const Text('Terms & Conditions', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),),
          ),
        ],
      ),
    );
  }
}
