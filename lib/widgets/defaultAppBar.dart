import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.purple),
        onPressed: () => Navigator.of(context).pop(),
      ),
      centerTitle: true,
      title:  Text(title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.purple
          ),
        ), 
    );
  }
  
  
}