import 'package:app2/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../themes/app_colors.dart';

class ColorOption extends StatelessWidget {
  const ColorOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( padding:EdgeInsets.fromLTRB(32,0,32,0),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Color Option',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
          Spacing.h8,
          Row(
           
            children: [
              Container(
                // child: Icon(Icons.circle,color: AppColors.primary500,),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: AppColors.primary500,),
              
              ),
              child: Icon(Icons.circle_rounded,color: AppColors.primary500,)
              ),
     Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: Icon(Icons.circle_rounded,color:Color.fromRGBO(34, 49, 63, 0.3))),
               Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: Icon(Icons.circle_rounded,color: Color.fromRGBO(40, 43, 55, 1),))
            ],
          )
        ],
      ),
    );
  }
}