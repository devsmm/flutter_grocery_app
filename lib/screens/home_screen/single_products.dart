import 'package:flutter/material.dart';

Widget singleProducts(String imageLink, String name, String unit, int price) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 5,
    ),
    height: 200,
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
                SizedBox(
                  height: 5,
                ),
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
