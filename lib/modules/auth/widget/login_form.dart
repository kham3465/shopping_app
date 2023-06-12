import 'package:app2/bloc/app_cubit.dart';
import 'package:app2/modules/auth/bloc/auth_cubit.dart';
import 'package:app2/modules/auth/widget/auth_button.dart';
import 'package:app2/modules/auth/widget/auth_divider.dart';
import 'package:app2/modules/auth/widget/info_field.dart';
import 'package:app2/modules/auth/widget/passWord_field.dart';
import 'package:app2/modules/auth/widget/sso_logo.dart';
import 'package:app2/themes/spacing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:app2/route/app_router.dart';
// ignore: unused_import
import 'package:app2/route/router_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key,});
  final TextEditingController _usernameController =
      TextEditingController(text: '');
  final  _passwordController = TextEditingController(text: '');
  void _handleLoginButtonTap(BuildContext context) {
    print(
        "Login with ${_usernameController.text} - ${_passwordController.text} ");
    _login(context);
  }
 void _login(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final authCubit = context.read<AuthCubit>();
    authCubit.login(username, password);
  }
  void _pushToMainScreen(User user, BuildContext context) {
    print("Navigate to main screen");
    // update app state
    final appCubit = context.read<AppCubit>();
    appCubit.authenticate(user, "token 12345678");
    //
    Navigator.pushNamed(context, RouteName.home, arguments: user);
  }


   void _showErrorMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 10),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
      children: [
        InfoField(controller:_usernameController,hintText: 'Email',),
        Spacing.h16,
         PasswordField(controller:_passwordController,hintText: 'Enter your password',),
         Spacing.h16,
         
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    
                      onTap: (){
                        Navigator.pushNamed(context,RouteName.signUp);
                      },
                      child: const Text('Register',style: TextStyle(color:Color.fromRGBO(47, 107, 255, 1)),),
                     ),
                ],
              ),
            
          
Spacing.h32,
         AuthButton(link: ' ',
          title: 'Sign In',
          onPressed: (){
            _handleLoginButtonTap(context);
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