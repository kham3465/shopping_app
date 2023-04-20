import 'package:flutter/material.dart';

class SsoLogo extends StatelessWidget {
  const SsoLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height:48,
          width: 48,
          padding: const EdgeInsets.all(10),
          color: const Color.fromRGBO(255, 255, 255, 1),
          decoration: BoxDecoration(color:Colors.white,
          borderRadius: BorderRadius.circular(8)),
          child: Image.asset('assets/images/google.png'),
      
    );
  }
}