import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/features/auth/viewmodel/login_provider.dart';
import 'package:sw_flutter_carlos/service_locator.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final bool showLoggoutButton;

  const DefaultAppBar({super.key, this.title = '', this.leading, this.showLoggoutButton = false});

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
      actions:
          showLoggoutButton
              ? [
                Padding(
                  padding: const EdgeInsets.only(right: Spacing.x2),
                  child: TextButton(
                    onPressed: () => sl<LoginProvider>().logout(context),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.white),
                        const SizedBox(width: Spacing.x1),
                        Text('Sair', style: AppTextStyle.body(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ]
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
