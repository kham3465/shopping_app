import 'package:app2/modules/auth/screen/auth_button.dart';
import 'package:app2/modules/auth/widget/auth_divider.dart';
import 'package:app2/modules/auth/widget/info_field.dart';
import 'package:app2/modules/auth/widget/passWord_field.dart';
import 'package:app2/modules/auth/widget/sso_logo.dart';
import 'package:app2/themes/spacing.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:app2/route/app_router.dart';
// ignore: unused_import
import 'package:app2/route/router_name.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key,});
final TextEditingController _usernameController=TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
      children: [
        InfoField(controller:_usernameController,hintText: 'Enter username',),
        Spacing.h16,
         PasswordField(controller:TextEditingController(),hintText: 'Enter your password',),
         Spacing.h16,
         
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    
                      onTap: (){
                        Navigator.pop(context,'/');
                      },
                      child: const Text('Recovery Password',style: TextStyle(color:Color.fromRGBO(47, 107, 255, 1)),),
                     ),
                ],
              ),
            
          
Spacing.h32,
         AuthButton(link: '/product',
          title: 'Sign In',
          onPressed: (){
            print('Sign In');
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