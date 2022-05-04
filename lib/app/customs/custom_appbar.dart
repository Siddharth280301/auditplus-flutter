import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const CustomAppBar({Key? key, required this.title, required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      elevation: 2,
      actions: actions,
      backgroundColor: CustomColors.grey800,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
