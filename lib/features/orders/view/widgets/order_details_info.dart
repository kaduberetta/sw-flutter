import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';

class OrderDetailsInfo extends StatelessWidget {
  const OrderDetailsInfo({
    required this.label,
    required this.value,
    this.showDivider = true,
    super.key,
  });

  final String label;
  final String value;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Spacing.x2),
      decoration: BoxDecoration(
        border:
            showDivider ? Border(bottom: BorderSide(color: ColorPalette.disabled, width: 1)) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyle.title()),
          const SizedBox(width: Spacing.x1),
          Expanded(
            child: Text(
              value,
              maxLines: 2,
              textAlign: TextAlign.end,
              style: AppTextStyle.body(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
