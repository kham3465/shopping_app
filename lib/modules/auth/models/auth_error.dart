import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const Map<String, AuthError> authErrorMap = {
  'invalid-email': AuthErrorInvalidEmail(),
  'invalid-password': AuthErrorInvalidEmail(),
  'user-not-found': AuthErrorInvalidEmail(),
  'wrong-password': AuthErrorWrongPassword()
  
};

@immutable
class AuthError {
  final String title;
  final String message;

  const AuthError({
    required this.title,
    required this.message,
  });

  AuthError copyWith({
    String? title,
    String? message,
  }) {
    return AuthError(
      title: title ?? this.title,
      message: message ?? this.message,
    );
  }

  factory AuthError.from(FirebaseAuthException exception) {
    return authErrorMap[exception.code] ?? const AuthErrorUnknown();
  }

  @override
  String toString() => 'AuthError(title: $title, message: $message)';
}

class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail()
      : super(
          title: "Invalid Email",
          message: "The email address is not valid.",
        );
}

class AuthErrorInvalidPassword extends AuthError {
  const AuthErrorInvalidPassword()
      : super(
          title: "Invalid Password",
          message: "The password is not valid.",
        );
}

class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound()
      : super(
          title: "User Not Found",
          message: "There is no user with the given email address.",
        );
}

class AuthErrorWrongPassword extends AuthError {
  const AuthErrorWrongPassword()
      : super(
          title: "Wrong Password",
          message: "The password is incorrect.",
        );
}

class AuthErrorUnknown extends AuthError {
  const AuthErrorUnknown()
      : super(
          title: "Unknown Error",
          message: "Exit 1",
        );
}