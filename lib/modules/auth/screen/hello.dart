import 'package:app2/themes/app_colors.dart';
import 'package:app2/themes/spacing.dart';
import 'package:app2/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  Stack(
          children: [
            Image.asset(
              'assets/images/hello.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Spacing.h162,
                  Text('Không khí ngày nay ngày càng ô nhiễm',style: TextStyles.t16R,),
                  Spacing.h32,
                  Text('Bạn muốn xem chất lượng không khí hôm nay',style: TextStyles.t16R),
                  Spacing.h32,
   ElevatedButton(
                onPressed:() {
                  Navigator.pushNamed(context,'/air');
                }, 
              child: Text("Xem ngay",style:TextStyles.t32M,),
              )
                ],
              )
            
            ),
          ],
        ),
    );
  }
}