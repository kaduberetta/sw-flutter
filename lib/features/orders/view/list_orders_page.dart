import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/core/routes/route_constants.dart';
import 'package:sw_flutter_carlos/core/widgets/default_app_bar.dart';
import 'package:sw_flutter_carlos/core/widgets/primary_button.dart';
import 'package:sw_flutter_carlos/features/orders/view/widgets/order_card.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/list_orders_provider.dart';

class ListOrdersPage extends StatelessWidget {
  const ListOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: DefaultAppBar(title: 'Meus Pedidos', showLoggoutButton: true),
        body: SafeArea(
          child: Consumer<ListOrdersProvider>(
            builder: (context, provider, _) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: const EdgeInsets.all(Spacing.x2),
                child: Column(
                  children: [
                    PrimaryButton(
                      label: 'Novo Pedido',
                      prefixIcon: Icons.add,
                      onPressed: () => context.push(RouteConstants.createOrder),
                    ),
                    const SizedBox(height: Spacing.x2),
                    const TabBar(tabs: [Tab(text: 'Pendentes'), Tab(text: 'Finalizados')]),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView.separated(
                            itemCount: provider.pendingOrders.length,
                            padding: EdgeInsets.only(top: Spacing.x2),
                            separatorBuilder: (context, index) => SizedBox(height: Spacing.x1),
                            itemBuilder: (context, index) {
                              return OrderCard(order: provider.pendingOrders[index]);
                            },
                          ),
                          ListView.separated(
                            itemCount: provider.finishedOrders.length,
                            padding: EdgeInsets.only(top: Spacing.x2),
                            separatorBuilder: (context, index) => SizedBox(height: Spacing.x1),
                            itemBuilder: (context, index) {
                              return OrderCard(order: provider.finishedOrders[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
