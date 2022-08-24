import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/screens/home_screen/cart_screen.dart';
import 'package:grocery_app/screens/home_screen/drawer.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);
// 'question_answer_outlined',question_mark
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerApp(context),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color(0xffd6b738),
        title: const Text('FAQ\'s', style: TextStyle(color: Colors.black)),
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
      body: ListView(children: [
        Image(
            image: NetworkImage(
                'https://www.pngitem.com/pimgs/m/404-4040941_faq-png-clipart-frequently-asked-questions-transparent-png.png')),
        listTile(
            icon: Icons.question_mark_outlined,
            title: 'What is this app used for?'),
        listTile(
            icon: Icons.question_answer_outlined,
            title: 'This App is used for Grocery.'),
        Divider(
          color: Colors.black,
        ),
        listTile(
            icon: Icons.question_mark_outlined,
            title: 'What other feature is available here?'),
        listTile(
            icon: Icons.question_answer_outlined,
            title: 'This App consists of special cart feature.'),
        Divider(
          color: Colors.black,
        ),
        listTile(
            icon: Icons.question_mark_outlined,
            title: 'What product is speciality?'),
        listTile(
            icon: Icons.question_answer_outlined,
            title: 'The main products are fruits and vegetables.'),
        Divider(
          color: Colors.black,
        ),
        listTile(
            icon: Icons.question_mark_outlined, title: 'When was it launched?'),
        listTile(
            icon: Icons.question_answer_outlined,
            title: 'It was launched in 2022.'),
        Divider(
          color: Colors.black,
        ),
        listTile(
            icon: Icons.question_mark_outlined,
            title: 'Can we Selected all items?'),
        listTile(
            icon: Icons.question_answer_outlined,
            title: 'Yes, all items can be selected with multiple quantites.'),
        Divider(
          color: Colors.black,
        ),
      ]),
    );
  }
}
