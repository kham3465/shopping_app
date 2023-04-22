import 'package:app2/modules/auth/widget/color_option.dart';
import 'package:app2/modules/auth/widget/paragrap.dart';
import 'package:app2/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../themes/app_colors.dart';
import '../widget/price.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          _buildBackground(),
          Spacing.h32,
          SafeArea(
          child: 
          Column(
    children: [        
           Row(           
            mainAxisAlignment: MainAxisAlignment.end,           
            children:[             
              Container(
           child: const Text('Product',
           style: TextStyle(fontSize: 30),
           ),
          ),
          Spacing.v32,Spacing.v32,Spacing.v12,
          const Icon(Icons.trolley)
          ,Spacing.v32
          ],
          ),
        ])
      ),
      

      ])
    );
  }
}
Widget _buildBackground(){
  return Container(
    width: double.maxFinite,
    height:double.maxFinite,
    decoration: const BoxDecoration(
      color:AppColors.mainBackground,
    ),
    
    alignment: Alignment.topLeft,

    child:AspectRatio(aspectRatio:150/200,child:    Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(40),
    image: const DecorationImage(
      image: AssetImage('assets/images/image 1.png'),
      fit: BoxFit.fill,
    ),
  ),
  ))

  );
  

}
