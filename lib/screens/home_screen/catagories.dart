import 'dart:core';

import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import 'package:grocery_app/database/db_helper.dart';
import 'package:grocery_app/models/cart_model.dart';

import 'package:grocery_app/provider/cart_provider.dart';
import 'package:grocery_app/screens/home_screen/cart_screen.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

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

  Widget singleProducts(String imageLink, String name) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      height: 250,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffd9dad9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(imageLink),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$name',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  const Text(
                    'Rs.100/50 grams',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text('Add to Cart',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  )
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         padding: const EdgeInsets.only(
                  //           left: 2,
                  //         ),
                  //         height: 30,
                  //         width: 50,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.grey),
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //         child: Row(
                  //           children: const [
                  //             Expanded(
                  //               child: Center(
                  //                 child: Text('100 grams',
                  //                     style: TextStyle(
                  //                       color: Colors.black,
                  //                       fontSize: 12,
                  //                       fontWeight: FontWeight.bold,
                  //                     )),
                  //               ),
                  //             ),
                  //             Icon(
                  //               Icons.arrow_drop_down,
                  //               color: Colors.black,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         height: 30,
                  //         width: 50,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.grey),
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //         // child: Row(
                  //         //   mainAxisAlignment: MainAxisAlignment.center,
                  //         //   children: [
                  //         //     Icon(
                  //         //       Icons.remove,
                  //         //       size: 15,
                  //         //     ),
                  //         //     Text(
                  //         //       '1',
                  //         //       style: TextStyle(fontWeight: FontWeight.bold),
                  //         //     ),
                  //         //     Icon(
                  //         //       Icons.add,
                  //         //       size: 15,
                  //         //     )
                  //         //   ],
                  //         // ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
          drawer: Drawer(
            child: Container(
              color: Color(0xffd1ad17),
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white54,
                          radius: 43,
                          child: CircleAvatar(
                            backgroundColor: Colors.yellow,
                            radius: 40,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Welcome '),
                            SizedBox(
                              height: 7,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          child: Column(
                        children: <Widget>[
                          FlatButton(
                            child: Text("Home"),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                            },
                          ),
                          FlatButton(
                            child: Text("About "),
                            onPressed: () {},
                          ),
                          FlatButton(
                            child: Text("Cart"),
                            onPressed: () {},
                          ),
                          FlatButton(
                            child: Text("FAQs"),
                            onPressed: () {},
                          ),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    height: 350,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Contact Support'),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text('Call us:'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('+977-9841234567'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text('Mail us:'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('grocery@gmail.com'),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
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
