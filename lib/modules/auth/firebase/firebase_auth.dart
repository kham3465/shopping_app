import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth=FirebaseAuth.instance;
Future<void> register(String email,String passWorld)async{
  try{
    UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email, password:passWorld);
    User? user=userCredential.user;
  }
  catch(e){
    print('error');
  }
}