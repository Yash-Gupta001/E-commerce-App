import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final double elevation;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final TextStyle? titleStyle;
  final double toolbarHeight;

  const CustomAppbar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.orangeAccent,
    this.elevation = 4.0,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.titleStyle,
    this.toolbarHeight = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: leading ?? IconButton(  // Default leading icon if not provided
        icon: Icon(Icons.menu),
        onPressed: () {
          // Add your menu navigation or functionality here
          print('Menu button pressed');
        },
      ),
      actions: actions,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: titleStyle ?? TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
