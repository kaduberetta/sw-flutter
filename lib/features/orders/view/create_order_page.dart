import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/core/widgets/default_app_bar.dart';
import 'package:sw_flutter_carlos/core/widgets/default_snack_bar.dart';
import 'package:sw_flutter_carlos/core/widgets/default_text_field.dart';
import 'package:sw_flutter_carlos/core/widgets/primary_button.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/create_order_provider.dart';

class CreateOrderPage extends StatelessWidget {
  CreateOrderPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateOrderProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: ColorPalette.background,
          appBar: DefaultAppBar(title: 'Novo Pedido'),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(Spacing.x2),
            child: PrimaryButton(
              label: 'Criar Pedido',
              isLoading: provider.isLoading,
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  final order = await provider.createOrder();
                  if (context.mounted) {
                    if (provider.isSuccess && order != null) {
                      context.pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        DefaultSnackBar.success(message: 'Pedido criado com sucesso!'),
                      );
                    } else if (provider.hasError && provider.errorMessage != null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(DefaultSnackBar.error(message: provider.errorMessage!));
                    }
                  }
                }
              },
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.x2),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: Spacing.x2),
                    Image.asset('assets/images/swfast-logo-short.png', width: 200),
                    const SizedBox(height: Spacing.x4),
                    DefaultTextField(
                      hintText: 'Nome do Cliente',
                      onChanged: provider.setCustomerName,
                      validator:
                          (value) =>
                              (value == null || value.isEmpty) ? 'Informe o nome do cliente' : null,
                    ),
                    const SizedBox(height: Spacing.x2),
                    DefaultTextField(
                      hintText: 'Descrição do Pedido',
                      onChanged: provider.setDescription,
                      validator:
                          (value) =>
                              (value == null || value.isEmpty) ? 'Informe a descrição' : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
