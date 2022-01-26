import 'package:flutter/material.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final bool? automaticallyImplyLeading;
  final bool? centerTitle;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final double? elevation;
  final double? height;

  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.backgroundColor,
    this.height,
    this.actions,
    this.automaticallyImplyLeading,
    this.elevation,
    this.centerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      leading: leading,
      title: title ?? Container(),
      centerTitle: centerTitle ?? false,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
