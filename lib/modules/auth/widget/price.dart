import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../themes/app_colors.dart';


class title extends StatelessWidget {
  const title({super.key});

@override
  Widget build(BuildContext context) {
    return Container(
          height: 125,
          padding: const EdgeInsets.all(32),
          child: Row(
            children: [
              Expanded(child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text('115.00',
                    style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 28,color:AppColors.primary500
                    ),
                    ),
                  ),
                  Text('MinimailcChar',style:TextStyle(
                    fontSize: 26,
                    fontWeight:FontWeight.w500,
color: Color.fromRGBO(34, 49, 63, 1)
                  ),
                  )
                ],
                )
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
Icons.star,color: Colors.amber,
            ),
              Icon(
Icons.star,color: Colors.amber,
            ),
           
            ],
          ),
        );
  
  }
}