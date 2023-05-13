import 'package:app2/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app2/themes/text_styles.dart';
import 'package:app2/modules/auth/screen/sign_up_screen.dart';


class AuthButton extends StatelessWidget {
  const AuthButton({super.key,required this.title,required this.onPressed,required this.link});
final String title;
final Function onPressed;
final link;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => onPressed(), 
    child: Text(title,
    style: TextStyles.t20M,),
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary500,padding: EdgeInsets.all(16)
      ,minimumSize:Size(double.maxFinite, 56),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8) )
    ),);
  }
}