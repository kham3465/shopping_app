import 'package:firebase_auth/firebase_auth.dart';

class AppState{
 final  String? token;
  final User? user;
  AppState({
    this.token,
    this.user
  });
}
class AppStateAuthenticated extends AppState{
  AppStateAuthenticated({required String token,required User user}):super(token: token,user:user);
}
class UnAuthenticated extends AppState{
  UnAuthenticated():super();
}