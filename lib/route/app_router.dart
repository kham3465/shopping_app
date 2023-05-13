
// ignore: avoid_web_libraries_in_flutter

import 'package:app2/bloc/app_cubit.dart';
import 'package:app2/modules/auth/bloc/auth_cubit.dart';
import 'package:app2/modules/auth/screen/login_screen.dart';
import 'package:app2/modules/auth/screen/product.dart';
import 'package:app2/modules/auth/screen/sign_up_screen.dart';
import 'package:app2/modules/auth/widget/items.dart';
import 'package:app2/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../modules/auth/screen/cart.dart';
import '../modules/auth/screen/home.dart';

class AppRouter{
  AppRouter._instance();
  static final AppRouter instance=AppRouter._instance();
final AppCubit _appCubit=AppCubit();

  Route? onGenerateRoute(RouteSettings settings){
   switch (settings.name) {
     case RouteName.signUp:
       return MaterialPageRoute(builder: (context)=>const SignUp(),
       settings: const RouteSettings(name: RouteName.signUp)
       );
      case RouteName.login:
       return MaterialPageRoute(
         builder: (context) => MultiBlocProvider(
               providers: [
                BlocProvider(create: (context)=>AuthCubit()),
                BlocProvider.value(value: _appCubit),
               ],
               child: LoginScreen(),),
       settings: const RouteSettings(name: RouteName.login)
       );
    case RouteName.product:
       return MaterialPageRoute(
        builder: (context)=>MultiProvider(
      providers: [
        BlocProvider<ItemCubit>(
          create: (context) => ItemCubit(),
        ),],
        child:const Product(),),
       settings: const RouteSettings(name: RouteName.product)
       );
        case RouteName.home:
       return MaterialPageRoute(
        builder: (context)=>MultiProvider(
      providers: [
        BlocProvider<ItemCubit>(
          create: (context) => ItemCubit(),
        ),],
        child:const Home(),),
       settings: const RouteSettings(name: RouteName.home)
        ) ;
            case RouteName.cart:
     return MaterialPageRoute(
        builder: (context)=>MultiProvider(
      providers: [
        BlocProvider<ItemCubit>(
          create: (context) => ItemCubit(),
        ),],
        child:const Cart(),),
       settings: const RouteSettings(name: RouteName.cart)
       );
      
     default:
   }
   return null;

  }
}