import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/product_utils.dart';
import '../../utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        leading: const Icon(Icons.menu_open_sharp),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.CartPage);
            },
            icon: const Icon(Icons.add_shopping_cart_sharp),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...allproducts
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: h * 0.3,
                            width: w * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 4),
                                  blurRadius: 3,
                                )
                              ],
                            ),
                            child: Image.network(
                              e["thumbnail"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
            const Text(
              "Recomented",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    allproducts.length ~/ 2,
                    (index) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  MyRoutes.DetailPage,
                                  arguments: allproducts[index * 2]);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 5, left: 5),
                              height: h * 0.3,
                              width: w * 0.4,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pink,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: h * 0.2,
                                    width: w * 0.35,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            NetworkImage("${e["thumbnail"]}"),
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  MyRoutes.DetailPage,
                                  arguments: allproducts[index * 2 + 1]);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 5, left: 5),
                              height: h * 0.3,
                              width: w * 0.4,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pink,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: h * 0.2,
                                    width: w * 0.35,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// child: Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           ...allproducts
//               .map(
//                 (e) => Container(
//               margin: EdgeInsets.only(right: 20),
//               height: h * 0.3,
//               width: w * 1,
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.grey,
//                     offset: Offset(3, 4),
//                     blurRadius: 3,
//                   )
//                 ],
//               ),
//               child: Image.network(
//                 e["thumbnail"],
//                 fit: BoxFit.cover,
//               ),
//             ),
//           )
//               .toList(),
//           const SizedBox(
//             height: 5,
//           ),
//           const Text(
//             "Popular Product",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 22,
//             ),
//           ),
//         ],
//       ),
//     ),
//     SizedBox(
//       height: h * 0.01,
//     ),
//     const Text(
//       "Popular Products",
//       style: TextStyle(
//         fontSize: 28,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     SizedBox(
//       height: h * 0.01,
//     ),
//     Expanded(
//       child: SingleChildScrollView(
//         child: Column(
//           children: List.generate(
//             allproducts.length ~/ 2,
//                 (e) => Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     margin: const EdgeInsets.only(top: 20),
//                     height: h * 0.3,
//                     width: w * 0.8,
//                     decoration: BoxDecoration(
//                       // color: Colors.grey,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context)
//                                 .pushNamed(MyRoutes.DetailPage);
//                           },
//                           child: Expanded(
//                             child: Container(
//                               height: h * 0.2,
//                               width: w * 0.3,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(20),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     color: Colors.grey,
//                                     offset: Offset(4, 4),
//                                     blurRadius: 3,
//                                   )
//                                 ],
//                               ),
//                               child: Container(
//                                 height: h * 0.2,
//                                 width: w * 0.3,
//                                 color: Colors.blue,
//                                 child: Image.network(
//                                   allproducts[e * 2]['thumbnail'],
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: w * 0.02,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context)
//                                 .pushNamed(MyRoutes.DetailPage);
//                           },
//                           child: Expanded(
//                             child: Container(
//                               height: h * 0.3,
//                               width: w * 0.4,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(20),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     color: Colors.grey,
//                                     offset: Offset(4, 4),
//                                     blurRadius: 3,
//                                   ),
//                                 ],
//                               ),
//                               child: Container(
//                                 height: h * 0.2,
//                                 width: w * 0.3,
//                                 color: Colors.blue,
//                                 child: Image.network(
//                                   allproducts[e]['thumbnail'],
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
