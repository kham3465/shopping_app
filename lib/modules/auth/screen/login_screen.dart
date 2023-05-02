import 'package:app2/modules/auth/widget/auth_login.dart';
import 'package:app2/modules/auth/widget/login_form.dart';
import 'package:app2/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app2/themes/spacing.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    body:Stack(
      children: [
        _buildBackground(),
        SafeArea(
          child:SingleChildScrollView(
                    child: 
        Column(
          children:[
            Spacing.h32, 
            Container(
          alignment: Alignment.center,
              
              height: 150,
              child: const LoginTitle(title:'Welcome', 
              subTitle: 'Hello,let sign into your account!'),
            ),
        LoginForm()
          ],
        )
          ))
      ]
      )
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
    
    child:
     AspectRatio(aspectRatio: 390/224, child: Image.asset('assets/images/Vector 1.png',fit:BoxFit.fill)),
       );

}