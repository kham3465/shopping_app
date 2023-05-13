import 'package:app2/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MostItem extends StatelessWidget {
  const MostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 334,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('BEST SELLING',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
 Spacing.h32,
          Row(
          children: [
            Image.asset('assets/images/folo 5.png'),
            Spacing.v16,
            Column(
              children: [
                 Text(
                         'Itemname',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Spacing.h2,
                        Text('Description'),
                        Spacing.h2,
                     
                       
                            Text(
                              '\$250.000',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
              ],
            )
          ],
          )]),
        
      );
    
  }
}