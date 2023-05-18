import 'package:app2/modules/auth/widget/color_option.dart';
import 'package:app2/modules/auth/widget/items.dart';
import 'package:app2/modules/auth/widget/paragrap.dart';
import 'package:app2/modules/auth/widget/price.dart';
import 'package:app2/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/app_cubit.dart';
import '../../../bloc/app_state.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/spacing.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});
void addItemToCard(Item item, BuildContext context) {
 
    final cartCubit = context.read<CartCubit>();
    cartCubit.addProduct(item);
    Navigator.pushNamed(context, RouteName.cart);
}
  @override
  Widget build(BuildContext context) {
    return 
  BlocBuilder<CartCubit,List<Item>>(
      builder: (context, state) {
        print(state);
        final item = state;


       final items=item.last;
          return 
            SingleChildScrollView(

      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: const Icon(
                  IconData(0xf443, fontFamily:CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage),
                  color: AppColors.primary500,
                  size: 36,
                ),
              ),
              Spacing.v32,
            ],
          ),
          const TitlePrice(),
          Spacing.h2,
          const ColorOption(),
          Spacing.h2,
          const Paragrap(),
          Spacing.h16,

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
  children: <Widget>[
              Image.asset('assets/images/Rectangle 6.png'),
               Positioned(
      top: 20,
      left: 25,
      child:GestureDetector(onDoubleTap: () {
        
      },child: InkWell(
        onTap:(){
        addItemToCard(items, context);
        },
        child: Text(
          '+ Add to Cart',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      ),
      
    ),
  ],
          )],
          ),
        ],
      ),
    );
  }
  );   }
 
}  

