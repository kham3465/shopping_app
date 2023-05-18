import 'package:app2/modules/auth/widget/search.dart';
import 'package:app2/route/router_name.dart';
import 'package:app2/themes/spacing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/info_field.dart';
import '../widget/items.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widget/most.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
drawer: Container(
  width: 200,

  color: Colors.blue,
),
      body: SingleChildScrollView(
      child:Padding(
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
        mainAxisSize:MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    SearchBar(onChanged: (value) {
    
  },),

    InkWell(onTap: () {
      Navigator.pushNamed(context,RouteName.cart);
    },
      child: Icon(Icons.shopping_cart_outlined))
  ],
      ),
   Spacing.h24,
 ItemCarousel(),
 Spacing.h42,
 MostItem()
          ],
        ),
      ),
      )  );
  }
}