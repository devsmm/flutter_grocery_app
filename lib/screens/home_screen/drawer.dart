import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home_screen/catagories.dart';
import 'package:grocery_app/screens/home_screen/faq.dart';

import 'about_us.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

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

Widget drawerApp(context) {
  return Drawer(
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
                    backgroundImage: AssetImage('assets/store.png'),
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
                    Text('Welcome'),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: listTile(
                icon: Icons.home_outlined,
                title: 'Home',
              )),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              child:
                  listTile(icon: Icons.shopping_bag_outlined, title: 'Cart')),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
              child: listTile(icon: Icons.contact_page, title: 'About')),
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Faq()));
              },
              child:
                  listTile(icon: Icons.format_quote_outlined, title: 'FAQs')),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CatagoriesScreen()));
              },
              child:
                  listTile(icon: Icons.shop_2_outlined, title: 'Catagories')),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            height: 350,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
  );
}
