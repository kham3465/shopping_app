import 'package:app2/modules/auth/screen/auth_button.dart';
import 'package:app2/modules/auth/widget/auth_divider.dart';
import 'package:app2/modules/auth/widget/info_field.dart';
import 'package:app2/modules/auth/widget/passWord_field.dart';
import 'package:app2/modules/auth/widget/sso_logo.dart';
import 'package:app2/themes/spacing.dart';
import 'package:flutter/material.dart';

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
         AuthButton(
          title: 'Sign In',
          onPressed: (){
            print('Sign In');
          },
         ),
         Spacing.h32,
         const AuthDivider(),
         Spacing.h32,
       const SsoLogo(),
      ],
      ),
    );
  }
}