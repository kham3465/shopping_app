import 'package:app2/modules/auth/firebase/firebase_auth.dart';
import 'package:app2/modules/auth/widget/auth_button.dart';
import 'package:app2/modules/auth/widget/auth_divider.dart';
import 'package:app2/modules/auth/widget/info_field.dart';
import 'package:app2/modules/auth/widget/passWord_field.dart';
import 'package:app2/modules/auth/widget/sso_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../themes/spacing.dart';



class SignUpForm extends StatelessWidget {
   SignUpForm({super.key});
final TextEditingController _emailController=TextEditingController(text: '');
final TextEditingController _passwordControler=TextEditingController(text:'');

void _signUp(BuildContext context)async{
  final email=_emailController.text;
  final passWord=_passwordControler.text;
  register(email, passWord);
}
void _hideLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }

 void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  } 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          InfoField(controller:_emailController,hintText: 'Email',),
          Spacing.h16,
          InfoField(controller:TextEditingController(),hintText: 'Name',),
          Spacing.h16,
           PasswordField(controller:_passwordControler,hintText: 'Password',),
           Spacing.h16,
            PasswordField(controller:TextEditingController(),hintText: 'Confirm password',),
           Spacing.h16,
            Spacing.h16,
           AuthButton(link: '/logIn',
            title: 'Sign Up',
            onPressed: (){
              
              
              _signUp(context);
            },
           ),
           Spacing.h32,
           const AuthDivider(),
           Spacing.h32,
         Row(
          mainAxisSize:MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          SsoLogo(link: 'assets/images/google.png'),
          Spacing.v32,
         SsoLogo(link: 'assets/images/apple.png'),
         Spacing.v32,
         SsoLogo(link: 'assets/images/facebook.png'),
         ],)
        ],
      ),
    );
  }
}