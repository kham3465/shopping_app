import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../themes/spacing.dart';

class Paragrap extends StatelessWidget {
  const Paragrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.fromLTRB(32,25,32,0),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text('Description',style: TextStyle(
           fontWeight:FontWeight.bold,
           fontSize: 20,
          ) ),
          Spacing.h12,
          Text('There are many different types of chairs, each with its own'
           'unique style and purpose. Some common types of chairs include dining chairs, office chairs,' 
           'lounge chairs, rocking chairs, and recliners. ')
        ],
      ),
    );
  }
}