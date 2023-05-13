import 'package:app2/modules/auth/widget/items.dart';
import 'package:app2/themes/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../themes/app_colors.dart';


class TitlePrice extends StatelessWidget {
const TitlePrice({super.key});

@override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit,ItemState>(
        builder: (context, state) {
          return 
    Container(
          height:  80,
          padding:EdgeInsets.fromLTRB(32,0,32,0),
          child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Container(
                    
                    child: Text(state.selecteProducts!.price.toString(),
                    style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 28,color:AppColors.primary500
                    ),
                    ),
                  ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Text(state.selecteProducts!.name,
                  style:TextStyle(
                    fontSize: 20,
                    fontWeight:FontWeight.w500,
color: Color.fromRGBO(34, 49, 63, 1)
                  ),
                  ),
                
                
                
               Row(children: [
            Icon(
Icons.star,color: Colors.amber,
            ),
              Icon(
Icons.star,color: Colors.amber,
            ),
              Icon(
Icons.star,color: Colors.amber,
            ),
              Icon(
Icons.star,color: Colors.amber,
            ),
              Icon(
Icons.star_border,color: Colors.amber,
            ),Spacing.v4
            ,
            Text('4.5',)
                ]) 
           
          ],
          ),
        ]
        )
        );
  
   
  });}
    }
    
    
  