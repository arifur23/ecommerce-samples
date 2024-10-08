import 'package:ecommerce_samples/Data/models/category_model.dart';
import 'package:ecommerce_samples/Data/models/notification.dart';
import 'package:ecommerce_samples/Data/models/product.dart';
import 'package:flutter/material.dart';


class Data {

  static List<Product> products = [
    Product(id: 1, name: 'Pullover', details: 'Filler text is text that sha'
        'res some characteristics of'
        ' a real written text, but is random or otherwise generated.'
        ' It may be used to display a sample o'
        'f fonts, generate text for testing, or '
        'to spoof an e-mail spam filter', ratting: 5, price: 1089, image: 'assets/shoping.jpg', company: 'H&M', discount: 20, options :['Black', 'M']),
    Product(id: 2, name: 'Salwar Kameez', details: 'Filler text is text that sha'
        'res some characteristics of'
        ' a real written text, but is random or otherwise generated.'
        ' It may be used to display a sample o'
        'f fonts, generate text for testing, or '
        'to spoof an e-mail spam filter', ratting: 5, price: 2089, image: 'assets/shop1.jpg', company: 'AKH', discount: 30, options :['Black', 'M']),
    Product(id: 3, name: 'Chinon Salwar Kameez', details: 'Filler text is tex that sha'
        'res some characteristics of'
        ' a real written text, but is random or otherwise generated.'
        ' It may be used to display a sample o'
        'f fonts, generate text for testing, or '
        'to spoof an e-mail spam filter', ratting: 5, price: 3089, image: 'assets/shop2.jpg', company: 'USA', discount: 10, options :['Black', 'M']),
    Product(id: 4, name: 'Real Salwar Kameez', details: 'Filler text is tex that sha'
        'res some characteristics of'
        ' a real written text, but is random or otherwise generated.'
        ' It may be used to display a sample o'
        'f fonts, generate text for testing, or '
        'to spoof an e-mail spam filter', ratting: 5, price: 7089, image: 'assets/shop3.jpg', company: 'UK', discount: 5, options :['Black', 'M']),
    Product(id: 5, name: 'Georgette & Net - Anarkali', details: 'Filler text is tex that sha'
        'res some characteristics of'
        ' a real written text, but is random or otherwise generated.'
        ' It may be used to display a sample o'
        'f fonts, generate text for testing, or '
        'to spoof an e-mail spam filter', ratting: 5, price: 3089, image: 'assets/shop4.jpg', company: 'BD', discount: 20, options :['Black', 'M'] ),
    Product(id: 6, name: 'Embroidery on Art Silk Salwar Kameez', details: 'Filler text is tex that sha'
        'res some characteristics of'
        ' a real written text, but is random or otherwise generated.'
        ' It may be used to display a sample o'
        'f fonts, generate text for testing, or '
        'to spoof an e-mail spam filter', ratting: 5, price: 7089, image: 'assets/shoping.jpg', company: 'CTG', discount: 20,options :['Black', 'M'] ),
    Product(id: 7, name: 'Embroidery on Chinon Salwar Kameez', details: 'Filler text is tex that sha'
        'res some characteristics of'
        ' a real written text, but is random or otherwise generated.'
        ' It may be used to display a sample o'
        'f fonts, generate text for testing, or '
        'to spoof an e-mail spam filter', ratting: 5, price: 8089, image: 'assets/shop1.jpg', company: 'BR', discount: 20, options :['Black', 'M'] ),
    Product(id: 8, name: 'Cross Golap Bexi Shalwar Suit', details: 'Filler text is tex that sha'
        'res some characteristics of'
        ' a real written text, but is random or otherwise generated.'
        ' It may be used to display a sample o'
        'f fonts, generate text for testing, or '
        'to spoof an e-mail spam filter', ratting: 5, price: 3089, image: 'assets/shop2.jpg', company: 'Unknown', discount: 20, options :['Black', 'M'] ),
    Product(id: 9, name: 'Spring Sky Blue Digital Printed Cotton Shalwar Sui', details: 'Filler text is tex that sha'
        'res some characteristics of'
        ' a real written text, but is random or otherwise generated.'
        ' It may be used to display a sample o'
        'f fonts, generate text for testing, or '
        'to spoof an e-mail spam filter', ratting: 5, price: 2089, image: 'assets/shop3.jpg', company: 'Ours', discount: 20, options :['Black', 'M'] ),
    Product(id: 10, name: 'Blue & White Striped Cotton Kurti', details: 'Filler text is tex that sha'
        'res some characteristics of'
        ' a real written text, but is random or otherwise generated.'
        ' It may be used to display a sample o'
        'f fonts, generate text for testing, or '
        'to spoof an e-mail spam filter', ratting: 5, price: 9089, image: 'assets/shop4.jpg', company: 'RAG', discount: 20,options :['Black', 'M'] ),
  ];

  List<CategoryModel> categories = [
    CategoryModel(id: 1, name: 'Shoes', iconData: Icons.shower),
    CategoryModel(id: 2, name: 'Shirt', iconData: Icons.shield),
    CategoryModel(id: 3, name: 'Pant For Men', iconData: Icons.satellite_alt_sharp),
    CategoryModel(id: 4, name: 'Sari', iconData: Icons.landscape),
    CategoryModel(id: 5, name: 'Boot', iconData: Icons.join_inner_outlined),
  ];

  static List<Notifications> notifications = [
    Notifications(id: 1, title: "Order notification", body: "Your order has been processed and anytime can be shipped", isSeen: false, time: DateTime.now().toString()),
    Notifications(id: 2, title: "Order notification", body: "Your order has been processed and anytime can be shipped", isSeen: false, time: DateTime.now().toString()),
    Notifications(id: 3, title: "Order notification", body: "Your order has been processed and anytime can be shipped", isSeen: false, time: DateTime.now().toString()),
    Notifications(id: 4, title: "Order notification", body: "Your order has been processed and anytime can be shipped", isSeen: false, time: DateTime.now().toString()),
    Notifications(id: 5, title: "Order notification", body: "Your order has been processed and anytime can be shipped", isSeen: false, time: DateTime.now().toString()),
    Notifications(id: 6, title: "Order notification", body: "Your order has been processed and anytime can be shipped", isSeen: false, time: DateTime.now().toString()),
  ];

}