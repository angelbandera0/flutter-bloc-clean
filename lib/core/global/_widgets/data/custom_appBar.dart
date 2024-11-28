import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

       return AppBar(
      elevation: 0,
      actions: actions ?? [],
      leading: leading ?? Container(),
      leadingWidth: size.width * 0.18,
      toolbarHeight: size.height * 0.15,
      backgroundColor: Color(0xFF34393F),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFFFF4F01),
          fontSize: 20,
          letterSpacing: 1,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
      ),
  );

  }
}
