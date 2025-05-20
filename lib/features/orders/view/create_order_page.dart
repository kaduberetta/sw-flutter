import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/constants/consts.dart';
import 'package:sw_flutter_carlos/core/widgets/default_app_bar.dart';
import 'package:sw_flutter_carlos/core/widgets/default_text_field.dart';
import 'package:sw_flutter_carlos/core/widgets/primary_button.dart';

class CreateOrderPage extends StatelessWidget {
  CreateOrderPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Novo Pedido'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Spacing.x2),
        child: PrimaryButton(
          label: 'Criar Pedido',
          onPressed: () {
            // TODO: Implementar ação de finalizar pedido
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
                DefaultTextField(hintText: 'Nome do Pedido', onChanged: (value) {}),
                const SizedBox(height: Spacing.x2),
                DefaultTextField(hintText: 'Descrição do Pedido', onChanged: (value) {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
