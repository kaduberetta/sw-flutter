import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/features/auth/viewmodel/login_provider.dart';

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
                Consumer<LoginProvider>(
                  builder: (context, provider, _) {
                    return Padding(
                      padding: const EdgeInsets.only(right: Spacing.x2),
                      child: TextButton(
                        onPressed:
                            provider.isLoading
                                ? null
                                : () async {
                                  await provider.logout();
                                },
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.white),
                            const SizedBox(width: Spacing.x1),
                            provider.isLoading
                                ? Container(
                                  width: 16,
                                  height: 16,
                                  margin: const EdgeInsets.symmetric(horizontal: 6.2),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                                : Text('Sair', style: AppTextStyle.body(color: Colors.white)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ]
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
