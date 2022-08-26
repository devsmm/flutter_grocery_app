// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:grocery_app/provider/cart_provider.dart';
import 'package:grocery_app/screens/home_screen/drawer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'package:grocery_app/screens/home_screen/about_us.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home_screen/single_products.dart';
import 'package:grocery_app/screens/home_screen/catagories.dart';
import 'drawer.dart';

import '../../models/cart.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  List<String> productName = [
    'Basil',
    'Tomatoes',
    'Banana',
    'Oninos',
    'Grapes',
    'Apples',
    'Mixed Fruit Basket'
  ];
  List<String> productUnit = ['KG', 'KG', 'Dozen', 'KG', 'KG', 'Dozen', 'KG'];
  List<int> productPrice = [100, 60, 80, 120, 140, 160, 500];
  List<String> productImage = [
    'https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
    'https://www.freepnglogos.com/uploads/tomato-png/tomato-basic-knives-and-their-uses-1.png',
    'https://www.freepnglogos.com/uploads/banana-png/banana-clipart-transparent-background-pencil-and-19.png',
    'https://www.freepnglogos.com/uploads/onion-png/onion-maahir-foods-10.png',
    'https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png',
    'https://www.freepnglogos.com/uploads/apple-logo-png/apple-logo-latest-apple-logo-icon-gif-15.png',
    'https://www.freepnglogos.com/uploads/fruits-png/mixed-fruits-bowl-png-clipart-best-web-clipart-16.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: const Color(0xffcbcbcb),
          drawer: drawerApp(context),
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: const Color(0xffd6b738),
            title:
                const Text('Catagories', style: TextStyle(color: Colors.black)),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                child: Badge(
                  badgeContent: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return Text(value.getCounter().toString());
                    },
                  ),
                  animationDuration: Duration(microseconds: 300),
                  child: Icon(Icons.shopping_bag_outlined),
                ),
              ),
              SizedBox(
                width: 20.0,
              )
            ],
          ),

          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://edit.org/img/blog/vaq-greengrocer-fruits-vegetables-supermarket-templates-designs-posters.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Fresh Vegetables',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'view all',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Center(
                      child: FlatButton(
                        height: 40,
                        minWidth: 390,
                        child: Center(
                          child: Text(
                            ' Go to Catagories to buy',
                            style: TextStyle(fontSize: 15.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        color: Colors.green,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CatagoriesScreen(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      singleProducts(productImage[0], productName[0],
                          productUnit[0], productPrice[0]),
                      singleProducts(productImage[1], productName[1],
                          productUnit[1], productPrice[1]),
                      singleProducts(productImage[3], productName[3],
                          productUnit[3], productPrice[3]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Fresh Fruits',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'view all',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      singleProducts(productImage[4], productName[4],
                          productUnit[4], productPrice[4]),
                      singleProducts(productImage[5], productName[5],
                          productUnit[5], productPrice[5]),
                      singleProducts(productImage[6], productName[6],
                          productUnit[6], productPrice[6]),
                      singleProducts(productImage[2], productName[2],
                          productUnit[2], productPrice[2]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // body: Column(
          //   children: [
          //     Expanded(
          //         child: ListView.builder(
          //       itemCount: productName.length,
          //       itemBuilder: ((context, index) {
          //         return Card(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisSize: MainAxisSize.max,
          //                 children: [
          //                   Row(
          //                     children: [
          //                       Image(
          //                         height: 100,
          //                         width: 100,
          //                         image:
          //                             NetworkImage(productImage[index].toString()),
          //                       ),
          //                       SizedBox(
          //                         width: 10,
          //                       ),
          //                       Expanded(
          //                         child: Column(
          //                           mainAxisAlignment: MainAxisAlignment.center,
          //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                           mainAxisSize: MainAxisSize.max,
          //                           children: [
          //                             Text(
          //                               productName[index].toString(),
          //                               style: TextStyle(
          //                                   fontSize: 16,
          //                                   fontWeight: FontWeight.w500),
          //                             ),
          //                             SizedBox(
          //                               height: 5,
          //                             ),
          //                             Text(
          //                                 productUnit[index].toString() +
          //                                     ' ' +
          //                                     'Rs.' +
          //                                     productPrice[index].toString(),
          //                                 style: TextStyle(
          //                                     fontSize: 16,
          //                                     fontWeight: FontWeight.w500)),
          //                             Align(
          //                               alignment: Alignment.topRight,
          //                               child: Container(
          //                                 height: 35,
          //                                 width: 100,
          //                                 decoration: BoxDecoration(
          //                                     color: Colors.green,
          //                                     borderRadius:
          //                                         BorderRadius.circular(10)),
          //                                 child: Center(
          //                                   child: Text(
          //                                     'Add to Cart',
          //                                     style: TextStyle(color: Colors.white),
          //                                   ),
          //                                 ),
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                     ],
          //                   )
          //                 ]),
          //           ),
          //         );
          //       }),
          //     ))
          //   ],
          // ),
        );
      }),
    );
  }
}
