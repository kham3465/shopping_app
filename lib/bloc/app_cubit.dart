import 'package:app2/bloc/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  void authenticate(User user, String token) {
    emit(AppStateAuthenticated(token: token, user: user));
  }

  void logout() {
    emit(UnAuthenticated());
  }
}