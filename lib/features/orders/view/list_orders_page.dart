import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/core/widgets/default_app_bar.dart';
import 'package:sw_flutter_carlos/core/widgets/primary_button.dart';

class ListOrdersPage extends StatelessWidget {
  const ListOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Meus Pedidos'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.x2),
          child: Column(
            children: [
              PrimaryButton(
                label: 'Novo Pedido',
                prefixIcon: Icons.add,
                onPressed: () {
                  // TODO: Implementar ação de novo pedido
                },
              ),
              // ...adicione aqui a lista de pedidos...
            ],
          ),
        ),
      ),
    );
  }
}
