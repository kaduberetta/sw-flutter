import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/core/routes/route_constants.dart';
import 'package:sw_flutter_carlos/features/orders/model/order_model.dart';
import 'package:sw_flutter_carlos/features/orders/view/widgets/order_status_widget.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({required this.order, super.key});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorPalette.primary.withValues(alpha: .2),
      highlightColor: ColorPalette.primary.withValues(alpha: .2),
      onTap: () => context.push(RouteConstants.orderDetails, extra: order),
      child: Container(
        color: ColorPalette.border,
        padding: EdgeInsets.symmetric(vertical: Spacing.x2, horizontal: Spacing.x2),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.customerName, style: AppTextStyle.title()),
                  const SizedBox(height: Spacing.half),
                  Text(
                    order.description,
                    maxLines: 1,
                    style: AppTextStyle.body(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: Spacing.x2),
            OrderStatusWidget(isFinished: order.finished),
            const SizedBox(width: Spacing.x2),
            Icon(Icons.arrow_forward_ios, size: 16, color: ColorPalette.text),
          ],
        ),
      ),
    );
  }
}
