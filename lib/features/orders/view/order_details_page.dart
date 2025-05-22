import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/core/utils/date.dart';
import 'package:sw_flutter_carlos/core/widgets/default_app_bar.dart';
import 'package:sw_flutter_carlos/core/widgets/default_snack_bar.dart';
import 'package:sw_flutter_carlos/core/widgets/primary_button.dart';
import 'package:sw_flutter_carlos/features/orders/model/order_model.dart';
import 'package:sw_flutter_carlos/features/orders/view/widgets/order_details_info.dart';
import 'package:sw_flutter_carlos/features/orders/view/widgets/order_status_banner.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/order_details_provider.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({required this.order, super.key});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: DefaultAppBar(title: order.customerName),
          bottomNavigationBar:
              order.finished
                  ? null
                  : Padding(
                    padding: const EdgeInsets.all(Spacing.x2),
                    child: PrimaryButton(
                      label: 'Finalizar Pedido',
                      isLoading: provider.isLoading,
                      onPressed: () async {
                        await provider.finishOrder(order.id);
                        if (context.mounted) {
                          if (provider.isSuccess) {
                            context.pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              DefaultSnackBar.success(message: 'Pedido finalizado com sucesso!'),
                            );
                          } else if (provider.hasError && provider.errorMessage != null) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(DefaultSnackBar.error(message: provider.errorMessage!));
                          }
                        }
                      },
                    ),
                  ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.x2),
              child: Column(
                children: [
                  OrderStatusBanner(isFinished: order.finished),
                  OrderDetailsInfo(label: 'Nome do Clinete', value: order.customerName),
                  OrderDetailsInfo(label: 'Descrição', value: order.description),
                  OrderDetailsInfo(
                    label: 'Data de Criação',
                    value: DateFormatter.format(order.createdAt),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
