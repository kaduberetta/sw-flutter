import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';

class OrderStatusBanner extends StatelessWidget {
  const OrderStatusBanner({required this.isFinished, super.key});

  final bool isFinished;

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          isFinished
              ? ColorPalette.success.withValues(alpha: 0.5)
              : ColorPalette.danger.withValues(alpha: 0.5),
      margin: const EdgeInsets.only(bottom: Spacing.x2),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.x2),
        child: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.white),
            const SizedBox(width: Spacing.x2),
            Text(
              isFinished ? 'Pedido Finalizado' : 'Pedido Pendente',
              style: AppTextStyle.titleMedium(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
