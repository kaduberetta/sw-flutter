import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({required this.isFinished, super.key});

  final bool isFinished;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.x3,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.x1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacing.x1),
        color: isFinished ? ColorPalette.success : ColorPalette.danger,
      ),
      child: Center(
        child: Text(
          isFinished ? 'Finalizado' : 'Pendente',
          style: AppTextStyle.body(color: Colors.white),
        ),
      ),
    );
  }
}
