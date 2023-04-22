import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../themes/app_colors.dart';

class ColorOption extends StatelessWidget {
  const ColorOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Color Option'),
        Row(
          children: [
            Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),)

          ],
        )
      ],
    );
  }
}