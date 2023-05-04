import 'package:app2/route/app_router.dart';
// ignore: unused_import
import 'package:app2/themes/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
     title: 'Flutter layout demo',

        
        onGenerateRoute: AppRouter.instance.onGenerateRoute,
      );
        
}
}
// class MyApp2 extends StatelessWidget {
//   const MyApp2({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//      onGenerateRoute: (RouteSettings settings){
// switch (settings.name) {
//   case '/':
//   return MaterialPageRoute(builder: (context)=>const page3());
//     case '/page4':
//   return MaterialPageRoute(builder: (context)=>const page4());
//     case '/page5':
//   return MaterialPageRoute(builder: (context)=>const page5());
  
//   default:
//   return MaterialPageRoute(builder: (context)=>const PageNotFound());
// }

//      }
//      );
      
         
// }
// }