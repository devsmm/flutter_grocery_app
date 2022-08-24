import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/screens/home_screen/drawer.dart';

import 'cart_screen.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerApp(context),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color(0xffd6b738),
        title: const Text('About Us', style: TextStyle(color: Colors.black)),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Badge(
              animationDuration: Duration(microseconds: 300),
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: ListView(
        children: [
          Image(
              image: NetworkImage(
                  'https://www.eatthis.com/wp-content/uploads/sites/4/2020/08/grocery-app-online-shopping.jpg?quality=82&strip=1')),
          Image(
              image: NetworkImage(
                  'https://blog.foodmandu.com/wp-content/uploads/2021/02/grocery.jpg')),
          Image(
              image: NetworkImage(
                  'https://groceries.ng/storage/22/groceries-banner-4.jpg')),
        ],
      ),
    );
  }
}
