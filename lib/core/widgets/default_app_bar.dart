import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/color.dart';
import 'package:sw_flutter_carlos/core/constants/text_style.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const DefaultAppBar({super.key, this.title = '', this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextStyle.body()),
      centerTitle: true,
      backgroundColor: ColorPalette.primary,
      elevation: 2,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
