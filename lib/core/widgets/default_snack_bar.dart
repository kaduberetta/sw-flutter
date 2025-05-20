import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/color.dart';
import 'package:sw_flutter_carlos/core/constants/text_style.dart';

class DefaultSnackBar {
  static SnackBar info({required String message, int durationSeconds = 3}) {
    return SnackBar(
      content: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(child: Text(message, style: AppTextStyle.body(color: Colors.white))),
        ],
      ),
      backgroundColor: ColorPalette.info,
      duration: Duration(seconds: durationSeconds),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  static SnackBar error({required String? message, int durationSeconds = 3}) {
    return SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message ?? 'Erro não especificado',
              style: AppTextStyle.body(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: ColorPalette.danger,
      duration: Duration(seconds: durationSeconds),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  static SnackBar success({required String message, int durationSeconds = 3}) {
    return SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(child: Text(message, style: AppTextStyle.body(color: Colors.white))),
        ],
      ),
      backgroundColor: ColorPalette.success,
      duration: Duration(seconds: durationSeconds),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
