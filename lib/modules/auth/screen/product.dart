import 'package:app2/modules/auth/widget/color_option.dart';
import 'package:app2/modules/auth/widget/items.dart';
import 'package:app2/modules/auth/widget/paragrap.dart';
import 'package:app2/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../themes/app_colors.dart';
import '../widget/price.dart';
import '../widget/product_info.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body:BlocBuilder<ItemCubit, ItemState>(
        builder: (context, state) {
      if(state.selecteProducts==null){
        return Text('exit 1');
      }
      else{
      return Stack(
        children: [
          _buildBackground(),
          Spacing.h42,
          SafeArea(
          child: 
          SingleChildScrollView(
            child: Column(
              children: [   
             
             SizedBox(
              height: 400,
               child: Row(   
                        
                // mainAxisAlignment: MainAxisAlignment.end,  
                crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [   
                  Icon(Icons.arrow_back),                 
                  Text('Product',
                  style: TextStyle(fontSize: 30),
                  ),
                 GestureDetector(
                  onTap:() {
                   Navigator.pushNamed(context, '/home');
                 },
                 child:Icon(Icons.shopping_cart_outlined),),
                   
                       ],     
                    
                   ),
             ),
          const ProductInfo()
                ]
                  ),
          )
      ),
      

      ]);
    
    }
   } )    );
}
Widget _buildBackground(){
  return Container(
    width: double.maxFinite,
    height:double.maxFinite,
    decoration: const BoxDecoration(
      color:AppColors.mainBackground,
    ),
    
    alignment: Alignment.topLeft,

    // child:AspectRatio(aspectRatio:75/100,child:   
     child:Container(
      height: 455,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(32),
    image: const DecorationImage(
      image: AssetImage('assets/images/image 1.png'),
      fit: BoxFit.cover,
    ),
  ),
  )
  );
}
}