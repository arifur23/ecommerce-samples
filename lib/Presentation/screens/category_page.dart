import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String name;
  final int id;

  const CategoryPage({super.key, required this.name, required this.id});


  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Categories',
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
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: Text('Category Name ${widget.name} and Id ${widget.id}'),
        ),
      ),
    );
  }
}
