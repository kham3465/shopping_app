
// ignore: avoid_web_libraries_in_flutter

import 'package:app2/modules/auth/screen/login_screen.dart';
import 'package:app2/modules/auth/screen/product.dart';
import 'package:app2/modules/auth/screen/sign_up_screen.dart';
import 'package:app2/route/router_name.dart';
import 'package:flutter/material.dart';

class AppRouter{
  AppRouter._instance();
  static final AppRouter instance=AppRouter._instance();
  Route? onGenerateRoute(RouteSettings settings){
   switch (settings.name) {
     case RouteName.signUp:
       return MaterialPageRoute(builder: (context)=>const SignUp(),
       settings: const RouteSettings(name: RouteName.signUp)
       );
      case RouteName.login:
       return MaterialPageRoute(builder: (context)=>const LoginScreen(),
       settings: const RouteSettings(name: RouteName.login)
       );
    case RouteName.product:
       return MaterialPageRoute(builder: (context)=>const Product(),
       settings: const RouteSettings(name: RouteName.product)
       );
       
     default:
   }
   return null;

  }
}