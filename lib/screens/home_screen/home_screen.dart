// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:grocery_app/provider/cart_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_app/auth/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grocery_app/models/item_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/screens/home_screen/catagories.dart';

import '../../models/cart.dart';

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
    'https://www.pngitem.com/pimgs/m/54-542206_transparent-background-tomato-transparent-hd-png-download.png',
    'https://p.kindpng.com/picc/s/11-118958_banana-file-bananas-svg-wikimedia-commons-banana-png.png',
    'https://www.nicepng.com/png/detail/192-1925733_onion-free-png-image-transparent-background-onion-png.png',
    'https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png',
    'https://toppng.com/uploads/preview/apple-fruit-png-apple-fruit-transparent-11563073201mj52xnr1gp.png',
    'https://toppng.com/uploads/preview/basket-of-fruits-11563021115hxf8swa7s0.png'
  ];

  Widget singleProducts(String imageLink, String name, String unit, int price) {
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
                  Text(
                    '$unit: $price',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

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
            title: const Text('Home', style: TextStyle(color: Colors.black)),
            actions: [
              Badge(
                badgeContent: Text('0'),
                animationDuration: Duration(microseconds: 300),
                child: Icon(Icons.shopping_bag_outlined),
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
