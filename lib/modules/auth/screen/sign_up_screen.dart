// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/placeholder.dart';
// ignore: unused_import
import 'package:app2/modules/auth/screen/login_screen.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/spacing.dart';
import '../widget/auth_login.dart';
import '../widget/login_form.dart';
import '../widget/signup_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:  [
    _buildBackground(),
    SafeArea(
      child:SingleChildScrollView(
          child: 
        Column(
          children:[Spacing.h32, Container(
          alignment: Alignment.center,
              
              height: 150,
              child: const LoginTitle(title:'Sign Up', 
              subTitle: 'Create your Account!'),
            ),
        SignUpForm()
          ],
        )
      )
    )



        ],
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