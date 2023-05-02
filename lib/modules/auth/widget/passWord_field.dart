import 'package:app2/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app2/themes/text_styles.dart';
class PasswordField extends StatefulWidget {
  const PasswordField({super.key,required this.controller,required this.hintText});
final TextEditingController controller;
final String hintText;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
final _focusNode=FocusNode();
bool _isFocused=false;
final _defaultBorder=Border.all(color: AppColors.primary300,width: 1);
final _focusedBorder=Border.all(color: AppColors.primary400,width: 2);
 bool _obscureText=true;
@override
void initState(){
  _focusNode.addListener(_onFocusChange);
  super.initState();
  }
  void _onObscureChange(){
    setState(() {
     _obscureText= !_obscureText;
    });
  }
  void _onFocusChange(){
    setState((){
 _isFocused=_focusNode.hasFocus;
    });
  
  

  }
  @override
  void dispose(){
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border:_isFocused? _focusedBorder:_defaultBorder,
      borderRadius:BorderRadius.circular(8),
      color: Colors.white ),
child: TextField(
  controller: widget.controller,
  decoration: InputDecoration(
    border: InputBorder.none,hintText:widget.hintText,
    contentPadding: const EdgeInsets.all(16),
     suffixIcon: 
       Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child : GestureDetector(
              onTap:_onObscureChange,
              child:
            _obscureText
            ? const Icon(
              Icons.remove_red_eye,
              color: Colors.black54,)
              : const Icon(
              Icons.visibility_off,
              color: Colors.black54,
            ),
          ),
     ),
    
  ),
  style: TextStyles.t16R,
  focusNode:_focusNode ,
  obscureText: _obscureText,
),
    );
     
  }
  }
