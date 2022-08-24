import 'dart:core';

import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import 'package:grocery_app/database/db_helper.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/screens/home_screen/single_products.dart';
import 'package:grocery_app/provider/cart_provider.dart';
import 'package:grocery_app/screens/home_screen/cart_screen.dart';
import 'package:grocery_app/screens/home_screen/drawer.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/screens/home_screen/home_screen.dart';

class CatagoriesScreen extends StatelessWidget {
  DBHelper dbHelper = DBHelper();

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
    'https://www.pngitem.com/pimgs/m/54-542206_transparent-background-tomato-transparent-hd-png-download.png',
    'https://p.kindpng.com/picc/s/11-118958_banana-file-bananas-svg-wikimedia-commons-banana-png.png',
    'https://www.nicepng.com/png/detail/192-1925733_onion-free-png-image-transparent-background-onion-png.png',
    'https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png',
    'https://toppng.com/uploads/preview/apple-fruit-png-apple-fruit-transparent-11563073201mj52xnr1gp.png',
    'https://toppng.com/uploads/preview/basket-of-fruits-11563021115hxf8swa7s0.png'
  ];

  Widget listTile({IconData? icon, String? title}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title!,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
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
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: productName.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  Image(
                                    height: 100,
                                    width: 100,
                                    image: NetworkImage(
                                        productImage[index].toString()),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          productName[index].toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            productUnit[index].toString() +
                                                ' ' +
                                                'Rs.' +
                                                productPrice[index].toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: InkWell(
                                            onTap: () {
                                              dbHelper
                                                  .insert(Cart(
                                                      id: index,
                                                      productId:
                                                          index.toString(),
                                                      productName:
                                                          productName[index]
                                                              .toString(),
                                                      initialPrice:
                                                          productPrice[index],
                                                      productPrice:
                                                          productPrice[index],
                                                      quantity: 1,
                                                      unitTag:
                                                          productUnit[index]
                                                              .toString(),
                                                      image: productImage[index]
                                                          .toString()))
                                                  .then((value) {
                                                cart.addTotalPrice(double.parse(
                                                    productPrice[index]
                                                        .toString()));
                                                cart.addCounter();
                                                print(
                                                    'Product is added to cart.');
                                              }).onError((error, stackTrace) {
                                                print(error.toString());
                                              });
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: Text(
                                                  'Add to Cart',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
