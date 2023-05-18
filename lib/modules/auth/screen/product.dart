import 'package:app2/modules/auth/widget/color_option.dart';
import 'package:app2/modules/auth/widget/items.dart';
import 'package:app2/modules/auth/widget/paragrap.dart';
import 'package:app2/route/router_name.dart';
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
      body: Stack(
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
                  InkWell(onTap: () {
                    Navigator.pushNamed(context,RouteName.home);
                  },
                    child: Icon(Icons.arrow_back)),                 
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
      

      ]
      )
    );
    
    
    
  
}




Widget _buildBackground(){
  return BlocBuilder<CartCubit,List<Item>>(
      builder: (context, state) {
         print(state);
        final item = state;


       final items=item.last;
        return
  Container(
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
    image:  DecorationImage(
      image: AssetImage(items.linkImage),
      fit: BoxFit.cover,
    ),
  ),
  )
  );
});
}
}