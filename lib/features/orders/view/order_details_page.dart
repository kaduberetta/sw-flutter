import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/core/widgets/default_app_bar.dart';
import 'package:sw_flutter_carlos/core/widgets/primary_button.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({required this.order, super.key});

  final String order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: order),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.x2),
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.only(bottom: Spacing.x2),
                child: ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('Order Status'),
                  subtitle: Text('Pending'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Spacing.x2),
        child: PrimaryButton(
          label: 'Finalizar Pedido',
          onPressed: () {
            // TODO: Implementar ação de finalizar pedido
          },
        ),
      ),
    );
  }
}
