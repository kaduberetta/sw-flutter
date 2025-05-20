import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      title: Text(title, style: AppTextStyle.title(color: Colors.white)),
      centerTitle: true,
      backgroundColor: ColorPalette.primary,
      elevation: 2,
      leading:
          context.canPop()
              ? IconButton(
                onPressed: context.pop,
                icon: Icon(Icons.chevron_left, size: 24, color: Colors.white),
              )
              : SizedBox(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
