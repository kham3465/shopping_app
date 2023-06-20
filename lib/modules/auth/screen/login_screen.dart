import 'package:app2/bloc/app_cubit.dart';
import 'package:app2/modules/auth/bloc/auth_cubit.dart';
import 'package:app2/modules/auth/bloc/auth_state.dart';
import 'package:app2/modules/auth/models/auth_error.dart';
import 'package:app2/modules/auth/widget/auth_login.dart';
import 'package:app2/modules/auth/widget/login_form.dart';
import 'package:app2/themes/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app2/themes/spacing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../route/router_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
  void _navigatorHome(BuildContext context, User user) {
    print("Navigate to main screen");
    // update app state
    final appCubit = context.read<AppCubit>();
  appCubit.authenticate(user, "token 12345678");

    Navigator.of(context).pushNamedAndRemoveUntil(
        RouteName.hello, (route) => route.settings.name == RouteName.hello);
  }


  void _hideLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }



  void _showErrorDialog(BuildContext context, AuthError error) {
    showDialog(
      context:context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: Text(error.title),
          content: Text(error.message),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    body:Stack(
      children: [
        _buildBackground(),
        SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                // debugPrint(state.toString());
                if (state is AuthStateInProgress) {
                  print(" ==== LOAding");
                  _showLoadingDialog(context);
                  
                     
                }
                if(state is AuthStateFailure){
                      _hideLoadingDialog(context);
                      print('1');
                  _showErrorDialog(context, state.error!);
                  print('1');
                }
                if(state is AuthStateLoginSuccess){
                  print("aaaaa");
                   _hideLoadingDialog(context);
                 _navigatorHome(context,state.user!);
                  
                }
                 },
              builder: (context, state) {
         
          return SingleChildScrollView(
                    child: Column(
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
          );
          })
    )]
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