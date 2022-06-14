import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class defaultButton extends StatefulWidget {
  const defaultButton({
    Key? key,
    required this.title,
    required this.function,
    required this.variable,
  }) : super(
          key: key,
        );

  final String title;
  final Function function;
  final bool variable;

  @override
  State<defaultButton> createState() => _defaultButtonState();
}

class _defaultButtonState extends State<defaultButton> {


  @override
  Widget build(BuildContext context) {

    return OutlinedButton(
      onPressed: (){OnClick();},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
           widget.variable  ? const Color(0xFF6f2694) : Colors.white),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16));
        }),
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.variable ? Colors.white : Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  
  void OnClick(){
   widget.function();
  }
}
