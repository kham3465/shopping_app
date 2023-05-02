import 'package:app2/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/info_field.dart';
import '../widget/items.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.fromLTRB(28, 72, 28, 0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.reorder_rounded),
                Icon(Icons.account_box_rounded)
              ],
            ),
            Spacing.h32,
      Row(
  children: [
// Container(
//       decoration: BoxDecoration(
//         // color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(1),
//       ),
//       child: TextField(
//         decoration: const InputDecoration(
//           hintText: 'Search',
//           border: InputBorder.none,
//           icon: Icon(Icons.search),
//         ),
//       ),
//     ),
    Icon(Icons.shopping_cart_outlined)
  ],
      ),
   Spacing.h24,
   MyCarousel()
          ],
        ),
      ),
    );
  }
}