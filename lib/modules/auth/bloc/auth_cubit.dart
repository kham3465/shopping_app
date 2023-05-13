import 'package:app2/modules/auth/bloc/auth_state.dart';
import 'package:bloc/bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../models/auth_error.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  void login(String username, String password) async {
    // loading
    emit(AuthState.initial());

    // xử lí, lấy dữ liệu
    try {
      emit(AuthStateInProgress());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: username, password: password);
      emit(AuthStateLoginSuccess(user: credential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthStateFailure(error: AuthError.from(e)));
    }
  }
}