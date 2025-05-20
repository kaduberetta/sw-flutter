import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.prefixIcon,
    super.key,
  });

  final String label;
  final Function() onPressed;
  final bool isLoading;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Spacing.x6,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          side: BorderSide.none,
          backgroundColor: ColorPalette.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.half)),
        ),
        child:
            isLoading
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                    ),
                    const SizedBox(width: 12),
                    _getPrefixIcon(),
                    Text(
                      label,
                      style: AppTextStyle.bodySmall(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getPrefixIcon(),
                    Text(
                      label,
                      style: AppTextStyle.bodySmall(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }

  Widget _getPrefixIcon() {
    if (prefixIcon == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(right: Spacing.x1),
      child: Icon(prefixIcon, size: 16, color: Colors.white),
    );
  }
}
