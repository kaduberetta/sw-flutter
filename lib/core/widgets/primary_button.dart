import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({required this.label, required this.onPressed, super.key});

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Spacing.x6,
      child: OutlinedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          side: BorderSide.none,
          backgroundColor: ColorPalette.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.half)),
        ),
        child: Text(label, style: AppTextStyle.bodySmall(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
