import 'package:app2/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app2/themes/text_styles.dart';
class InfoField extends StatefulWidget {
  const InfoField({super.key,required this.controller,required this.hintText});
final TextEditingController controller;
final String hintText;

  @override
  State<InfoField> createState() => _InfoFieldState();
}

class _InfoFieldState extends State<InfoField> {
final _focusNode=FocusNode();
bool _isFocused=false;
final _defaultBorder=Border.all(color: AppColors.primary300,width: 1);
final _focusedBorder=Border.all(color: AppColors.primary400,width: 2);
@override
void initState(){
  _focusNode.addListener(_onFocusChange);
  super.initState();
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
  decoration:  InputDecoration(
    border: InputBorder.none,hintText:widget.hintText,
    contentPadding: EdgeInsets.all(16),
    
  ),
  style: TextStyles.t16R,
  focusNode:_focusNode ,
),
    );
     
  }
  }
