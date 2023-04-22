import 'package:app2/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize:MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width:42 ,height: 1,color:Colors.black26,
        ),
        Spacing.v4,
        const Text('Or continue with'),
        Spacing.v4,
         Container(
          width:42 ,height: 1,color:Colors.black26,
        ),
      ],
    );
  }
}