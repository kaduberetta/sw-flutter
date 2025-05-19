import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({required this.label, required this.onPressed, super.key});

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Spacing.x6,
      child: OutlinedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          overlayColor: ColorPalette.secondary,
          side: BorderSide(width: 2, color: ColorPalette.secondary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.half)),
        ),
        child: Text(label, style: AppTextStyle.bodySmall(fontWeight: FontWeight.bold, color: ColorPalette.secondary)),
      ),
    );
  }
}
