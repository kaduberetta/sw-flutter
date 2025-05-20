import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/core/routes/route_constants.dart';
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
              const SizedBox(height: Spacing.x2),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => SizedBox(height: Spacing.x1),
                  itemBuilder:
                      (context, index) => ListTile(
                        onTap:
                            () => context.push(
                              RouteConstants.orderDetails,
                              extra: 'Pedido #${index + 1}',
                            ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.x2),
                        hoverColor: ColorPalette.secondary.withValues(alpha: .1),
                        splashColor: ColorPalette.secondary.withValues(alpha: .2),
                        title: Text('Pedido #${index + 1}', style: AppTextStyle.title()),
                        subtitle: Text(
                          'Data: ${DateTime.now().toLocal()}',
                          style: AppTextStyle.body(),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: ColorPalette.text),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
